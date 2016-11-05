-- Convert a Lua table to a string representation of the Tcl dictionary
M = {}
T = require("PackageToolkit").module
head  = (T.import ..., "../_lists/_head").head
tail  = (T.import ..., "../_lists/_tail").tail
append  = (T.import ..., "../_lists/_append").append
get_keys = (T.import ..., "_keys").keys

M.tcl = (t, pretty=false, indent="  ") ->
    add_brackets_pretty = (s, prefix) -> string.format "{\n%s%s%s\n%s}", prefix, indent, s, prefix
    add_brackets = (s) -> string.format "{ %s }", s
    
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
            if pretty == true
                return add_brackets_pretty (table.concat accum, sep), prefix
            else
                return add_brackets (table.concat accum, " ")
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