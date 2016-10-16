M = {}
TK = require("PackageToolkit")
head = (TK.module.import ..., "..", "_head").head
tail = (TK.module.import ..., "..", "_tail").tail
append = (TK.module.import ..., "..", "_append").append

-- flatten all the lists/non-lists and combine them into one list
M.flatten = (...) ->
    args = {...}
    aux = (lists, accum) ->
        if #lists == 0
            return accum
        elseif (type lists[1]) == "table"
            return aux (tail lists), (aux lists[1], accum)
        else
            return aux (tail lists), (append accum, lists[1])
    return aux args, {}
return M
