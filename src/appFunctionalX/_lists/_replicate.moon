M = {}
TK = require("PackageToolkit")
parent = ...
root_parent = TK.module.root parent
append = TK.module.require  root_parent.."._lists._append", "append"
tail   = TK.module.require  root_parent.."._lists._tail", "tail"

-- Replicate an item a number of times and return a list
M.replicate = (n, item) -> 
    aux = (n, item, accum) ->
        if n <= 0
            return accum
        else
            return aux  (n-1), item, (append accum, item)
    return aux n, item, {}
return M