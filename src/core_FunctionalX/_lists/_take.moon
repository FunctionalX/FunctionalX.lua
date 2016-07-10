-- take n items from a list
M = {}
me = ...
TK = require("PackageToolkit")
root_parent = TK.module.root me
append = TK.module.require root_parent.."._lists._append", "append"
tail = TK.module.require root_parent.."._lists._tail", "tail"
head = TK.module.require root_parent.."._lists._head", "head"

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