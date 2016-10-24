M = {}
T = require("PackageToolkit").module
L = T.import(..., "../_lists")
S = T.import(..., "../_strings")

-- Return the path separator for the current OS
M.pathsep = () ->
    return L.head(S.split(package.config))
return M