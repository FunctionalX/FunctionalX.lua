M = {}
TK = require("PackageToolkit")
me = ...
root_parent = TK.module.root me
tail = TK.module.require root_parent.."._lists._tail", "tail"
append = TK.module.require root_parent.."._lists._append", "append"

-- take a the Cartesian product of two lists
M.cart2 = (list1, list2) -> 
    aux = (list1, list2, accum) ->
        if #list2 == 0 or #list1 == 0 
            return accum
        elseif #list1 == 1
            condition1 = (type list1[1]) != "string"
            condition2 = (type list2[1]) != "string"
            return {"strings.cart2() ERROR HINT: input cannot be list of lists"} if condition1 or condition2
            return aux list1, (tail list2), (append accum, list1[1]..list2[1])
        else
            return aux (tail list1), list2, (aux { list1[1] }, list2, accum)
    return {} if type(list1) != "table"
    return {} if type(list2) != "table"
    return aux list1, list2, {}
return M