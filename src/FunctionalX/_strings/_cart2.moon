M = {}
TK = require("PackageToolkit")
parent = ...
root_parent = TK.module_root parent
L = require  root_parent..".".."_lists"
-- take a the Cartesian product of two lists
M.cart2 = (list1, list2) -> 
    aux = (list1, list2, accum) ->
        if #list2 == 0 or #list1 == 0 
            return accum
        elseif #list1 == 1
            return aux list1, (L.tail list2), (L.append accum, list1[1]..list2[1])
        else
            return aux (L.tail list1), list2, (aux { list1[1] }, list2, accum)
    return {} if type(list1) != "table"
    return {} if type(list2) != "table"
    return aux list1, list2, {}
return M