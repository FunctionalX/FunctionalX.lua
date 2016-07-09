M = {}
TK = require("PackageToolkit")
parent = ...
root_parent = TK.module.root parent
L = require(root_parent.."._lists")
S = require(root_parent.."._strings")
-- return a path string given the subdirectories
M.path = (...) ->
    dir_separator = L.head S.split package.config
    aux = (subdirs, accum) ->
        if #subdirs == 0
            return accum
        else
            return aux (L.tail subdirs), accum..dir_separator..tostring(subdirs[1])
    args = {...}
    return "" if #args == 0
    return args[1] if #args == 1
    return aux (L.tail args), (tostring args[1])

return M