M = {}
TK = require("PackageToolkit")
me = ...
root = TK.module.root me
tail = TK.module.require root.."._lists._tail", "tail"
append = TK.module.require root.."._lists._append", "append"
path = TK.module.require root.."._directory._path", "path"

-- take a the Cartesian product of two lists
M.cart2 = (list1, list2) -> 
    aux = (list1, list2, accum) ->
        if #list2 == 0 or #list1 == 0 
            return accum
        elseif #list1 == 1
            return aux list1, (tail list2), (append accum, (path list1[1], list2[1]))
        else
            return aux (tail list1), list2, (aux { list1[1] }, list2, accum)
    return {} if type(list1) != "table"
    return {} if type(list2) != "table"
    return aux list1, list2, {}
return M