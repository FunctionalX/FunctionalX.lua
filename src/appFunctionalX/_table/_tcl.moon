-- Convert a Lua table to a string representation of the Tcl dictionary
M = {}
TK = require("PackageToolkit")
me = ...
root_parent = TK.module.root me
get_keys = TK.module.require root_parent.."._table._keys", "keys"
tail = TK.module.require root_parent.."._lists._tail", "tail"
head = TK.module.require root_parent.."._lists._head", "head"
append = TK.module.require root_parent.."._lists._append", "append"

M.tcl = (t, indent="  ") ->
    add_brackets = (s, prefix) -> string.format "{\n%s%s%s\n%s}", prefix, indent, s, prefix
    
    quote = (obj) ->
        if type(obj) =="string" and string.match obj, "%s" -- check whether whitespace is found
            return string.format "\"%s\"", obj
        else
            return tostring obj

    format_item = (k, v) ->
        if type(k) == "number"
            return string.format "%s", v
        else
            return string.format "%s %s", (quote k), v

    aux = (dict, keys, accum, prefix) ->
        if #keys == 0
            sep = string.format "\n%s%s", prefix, indent
            return add_brackets (table.concat accum, sep), prefix
        else
            k = head keys
            v = ""
            if type(dict[k]) == "table"
                v = aux dict[k], (get_keys dict[k]), {}, indent
            else
                v = quote dict[k]
            new_item = format_item k, v
            return aux dict, (tail keys), (append accum, new_item), prefix
    return aux t, (get_keys t), {}, ""
return M