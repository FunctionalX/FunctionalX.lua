M = {}
TK = require("PackageToolkit")
prepend = (TK.module.import ..., "_prepend").prepend
tail = (TK.module.import ..., "_tail").tail

-- Reverse a list
M.reverse = (list) -> 
    aux = (list, accum) ->
        if #list == 0
            return accum
        else
            return aux (tail list), (prepend list[1], accum)
    return aux list, {}
return M