-- check whether the host operating system is windows
M = {}
T = require("PackageToolkit").module
L  = T.import ..., "../_lists"
S  = T.import ..., "../_strings"
M.windows = () ->
    dir_separator = L.head S.split package.config
    return dir_separator == '\\'
return M
