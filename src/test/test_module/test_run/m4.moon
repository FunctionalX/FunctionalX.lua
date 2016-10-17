M = {}
me = ...
FX = require "FunctionalX"
T = (require "PackageToolkit").module
M.main = (...) -> 
    m = {
        T.import me,  "n2"
    }
    return unpack (FX.module.call m, ...)

return M