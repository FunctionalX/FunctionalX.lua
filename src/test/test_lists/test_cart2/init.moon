name = "test_cart2"
parent = ...
TK = require("PackageToolkit")
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    solution = {{1,3}, {1,4}, {2,3}, {2,4}}
    case {{1,2},{3,4}}, solution, "case 1"
    return true

return M