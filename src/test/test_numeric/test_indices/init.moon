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
    case fn, {3,"1 2"}, {{1,2}}, "numeric.indices case 3"
    case fn, {10,"1-4 5 6-8"}, {{1,2,3,4,5,6,7,8}}, "numeric.indices case 4"
    return true

return M