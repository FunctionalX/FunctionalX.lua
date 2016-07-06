parent = ...
TK = require("PackageToolkit")
test_case = (require parent..".test_case")["test_case"]
M = {}
M.test_next = -> 
    test_case {1,2}, 1, "case 1"
    return true

return M