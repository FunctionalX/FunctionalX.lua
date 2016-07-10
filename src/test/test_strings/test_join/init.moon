M = {}
me = ...
name = "test_join"
TK = require("PackageToolkit")
case = (require me..".case")["case"]
M[name] = -> 
    case " ", {1, 2, 3}, "1 2 3", "case 1"
    return true
return M