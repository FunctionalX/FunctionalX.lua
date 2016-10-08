-- drop n items from a list
M = {}
me = ...
TK = require("PackageToolkit")
root_parent = TK.module.root me
tail = TK.module.require root_parent.."._lists._tail", "tail"

M.drop = (n, list) ->
    return {} if (type list) != "table"
    aux = (n, list) ->
        if n == 0
            return list
        elseif #list == 0
            return {}
        else
            return aux (n - 1), (tail list)
    return aux n, list, {}
return M