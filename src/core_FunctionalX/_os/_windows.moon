-- check whether the host operating system is windows
M = {}
TK = require("PackageToolkit")
parent = ...
root_parent = TK.module.root parent
L = require(root_parent.."._lists")
S = require(root_parent.."._strings")
M.windows = () ->
    dir_separator = L.head S.split package.config
    return dir_separator == '\\'
return M
