name = "test_take"
me = ...
TK = require("PackageToolkit")
case = (require me..".case")["case"]
M = {}
M[name] = -> 
    case 0, {1}, {},  "case 0"
    case 1, {1}, {1}, "case 1"
    case 2, {1}, {1}, "case 2"
    case 2, {},  {},  "case 3"
    return true

return M