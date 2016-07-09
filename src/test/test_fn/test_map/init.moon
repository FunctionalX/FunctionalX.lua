name = "test_map"
me = ...
TK = require("PackageToolkit")
case = (require me..".case")["case"]
M = {}
M[name] = -> 
    add1 = (a) -> a + 1
    case add1, {10,20,30}, {11,21,31}, "case 1"
    return true

return M