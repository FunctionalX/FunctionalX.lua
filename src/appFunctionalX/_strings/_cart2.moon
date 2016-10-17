M = {}
T = require("PackageToolkit").module
L  = T.import ..., "../_lists"
tail = L.tail
append = L.append

-- take a the Cartesian product of two lists
M.cart2 = (list1, list2) -> 
    aux = (list1, list2, accum) ->
        if #list2 == 0 or #list1 == 0 
            return accum
        elseif #list1 == 1
            return aux list1, (tail list2), (append accum, tostring(list1[1])..tostring(list2[1]))
        else
            return aux (tail list1), list2, (aux { list1[1] }, list2, accum)
    return {} if type(list1) != "table"
    return {} if type(list2) != "table"
    return aux list1, list2, {}
return M