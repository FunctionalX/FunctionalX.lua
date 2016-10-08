M = {}
TK = require("PackageToolkit")
me = ...
root_parent = TK.module.root me
tail = TK.module.require root_parent.."._lists._tail", "tail"
head = TK.module.require root_parent.."._lists._head", "head"

-- Join many strings by a separtor symbol
M.join = (...) ->
    args = {...}
    separator = head args
    list = tail args
    aux = (list, accum) ->
        if #list == 0
            return accum
        else
            return aux (tail list), accum..separator..(tostring head list)
    return "" if #list == 0 
    return aux (tail list), (tostring head list)

return M