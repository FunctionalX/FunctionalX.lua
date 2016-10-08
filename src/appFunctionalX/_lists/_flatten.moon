M = {}
TK = require("PackageToolkit")
me = ...
root_parent = TK.module.root me
head = TK.module.require root_parent.."._lists._head", "head"
tail = TK.module.require root_parent.."._lists._tail", "tail"
append = TK.module.require root_parent.."._lists._append", "append"

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
