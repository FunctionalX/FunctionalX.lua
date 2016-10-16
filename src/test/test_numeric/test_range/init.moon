M = {}
name = "test_range"
me = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.numeric.range
    case fn, {1,5}, {{1,2,3,4,5}}, "numeric.range case 1"
    case fn, {1,5,2}, {{1,3,5}}, "numeric.range case 2"
    return true

return M