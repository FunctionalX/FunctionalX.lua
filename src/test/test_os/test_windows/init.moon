M = {}
name = "test_windows"
me = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.os.windows
    case fn, {}, true, "numeric.range case 1"
    return true

return M