name = "test_flatten"
parent = ...
TK = require("PackageToolkit")
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    solution = {1, 2, 3, 'a', 'b'}
    case {{1,2}, 3, {'a','b'}}, solution, "case 1"
    return true

return M