parent = ...
TK = require("PackageToolkit")
test_case = TK.subfunctions(parent, {"test_case"})["test_case"]
M.test_next = -> 
    test_case {1,2}, 1, "test case 1"
    return true
return M