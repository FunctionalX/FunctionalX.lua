M = {}
T = require("PackageToolkit").module
head  = (T.import ..., "..", "..", "_lists", "_head").head
tail  = (T.import ..., "..", "..", "_lists", "_tail").tail


-- Join many strings by a separtor symbol
M.join = (...) ->
    args = {...}
    separator = head args
    list = tail args
    aux = (list, accum) ->
        if #list == 0
            return accum
        else
            return aux (tail list), accum..separator..(tostring head list)
    return "" if #list == 0 
    return aux (tail list), (tostring head list)

return M