M = {}
TK = require("PackageToolkit")
parent = ...
root_parent = TK.module.root parent
prepend = TK.module.require  root_parent.."._lists._prepend", "prepend"
tail   = TK.module.require  root_parent.."._lists._tail", "tail"

-- Reverse a list
M.reverse = (list) -> 
    aux = (list, accum) ->
        if #list == 0
            return accum
        else
            return aux (tail list), (prepend list[1], accum)
    return aux list, {}
return M