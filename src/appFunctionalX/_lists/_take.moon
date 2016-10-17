-- take n items from a list
M = {}
TK = require("PackageToolkit")
append = (TK.module.import ..., "_append").append
tail = (TK.module.import ..., "_tail").tail
head = (TK.module.import ..., "_head").head

M.take = (n, list) ->
    return {} if (type list) != "table"
    aux = (n, list, accum) ->
        if n == 0
            return accum
        elseif #list == 0
            return accum
        else
            return aux (n - 1), (tail list), (append accum, (head list))
    return aux n, list, {}
return M