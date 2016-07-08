parent = ...
TK = require("PackageToolkit")
test_case = (require parent..".test_case")["test_case"]
M = {}
M.test_cart2 = -> 
    test_case {"a","b"}, {"1","2"}, {"a1", "a2", "b1", "b2"}, "case 1"
    return true

return M