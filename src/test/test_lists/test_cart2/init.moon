name = "test_cart2"
parent = ...
TK = require("PackageToolkit")
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    solution = {{1,3}, {1,4}, {2,3}, {2,4}}
    case {{1,2},{3,4}}, solution, "case 1"

    solution = {{1,2,'a'}, {1,2,'b'}, {3,'a'}, {3,'b'}}
    case {{{1,2},3}, {'a','b'}, true}, solution, "case 2"
    return true

return M