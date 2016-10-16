-- drop n items from a list
M = {}
TK = require("PackageToolkit")
tail = (TK.module.import ..., "..", "_tail").tail

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