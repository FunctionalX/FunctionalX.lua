name = "test_concatn"
parent = ...
TK = require("PackageToolkit")
test_case = (require parent..".test_case")["test_case"]
M = {}
M[name] = -> 
    solution = {1,2,3,4,5}
    test_case {{1,2},{3,4},{5}}, solution, "case 1"
    return true

return M