M = {}
TK = require("PackageToolkit")
parent = ...
root_parent = TK.module.root parent
L = require root_parent..".".."_lists"
cart2 = TK.module.require root_parent.."._strings._cart2", "cart2"

-- take a the Cartesian product for more than two lists
-- The input is a list of lists
M.cartn = (...) ->
    aux = (list1, other_lists) ->
        if #other_lists == 0
            return list1
        else
            return aux list1, {} if type(other_lists[1]) != "table"
            return aux (cart2 list1, other_lists[1]), (L.tail other_lists)
    args = {...}
    return {} if type(args) != "table"
    return {} if #args == 0
    return {} if type(args[1]) != "table"
    return args[1] if #args <= 1
    return aux args[1], (L.tail args)
return M