M = {}
name = "test_indices"
me = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.numeric.indices
    case fn, {3}, {{1,2,3}}, "numeric.indices case 1"
    case fn, {3,1,2}, {{1,2}}, "numeric.indices case 2"
    return true

return M