name = "test_next"
parent = ...
TK = require("PackageToolkit")
test_case = (require parent..".test_case")["test_case"]
M = {}
M[name] = -> 
    test_case {1,2}, 2, "case 1"
    return true

return M