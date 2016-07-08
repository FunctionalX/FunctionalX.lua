name = "test_concat"
parent = ...
TK = require("PackageToolkit")
test_case = (require parent..".test_case")["test_case"]
M = {}
M[name] = -> 
    solution = {1,2,3,4}
    test_case {{1,2},{3,4}}, solution, "case 1"
    return true

return M