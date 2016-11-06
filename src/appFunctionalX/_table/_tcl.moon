-- Convert a Lua table to a string representation of the Tcl dictionary
M = {}
T = require("PackageToolkit").module
head  = (T.import ..., "../_lists/_head").head
tail  = (T.import ..., "../_lists/_tail").tail
append  = (T.import ..., "../_lists/_append").append
get_keys = (T.import ..., "_keys").keys
add_brackets = (T.import ..., "_tcl_add_brackets").add_brackets

M.tcl = (t, pretty=false, expand=false, indent="  ") ->
    quote = (obj) ->
        if type(obj) =="string" and string.match obj, "%s" -- check whether whitespace is found
            if expand == true 
                return string.format "[ join [ list %s ] ]", obj
            else
                return string.format "{%s}", obj
        else
            return tostring obj

    format_item = (k, v) ->
        if type(k) == "number"
            return string.format "%s", v
        else
            return string.format "%s %s", (quote k), v

    aux = (dict, keys, accum, prefix) ->
        if #keys == 0
            if pretty == true
                sep = string.format "\n%s%s", prefix, indent
                return add_brackets (table.concat accum, sep), prefix, indent, true, expand
            else
                return add_brackets (table.concat accum, " "), "", "", false, expand
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