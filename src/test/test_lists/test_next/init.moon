name = "test_next"
parent = ...
TK = require("PackageToolkit")
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    case {1,2}, 2, "case 1"
    return true

return M