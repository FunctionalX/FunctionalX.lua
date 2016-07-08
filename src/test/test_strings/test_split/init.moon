parent = ...
TK = require("PackageToolkit")
test_case = (require parent..".test_case")["test_case"]
M = {}
M.test_split = -> 
    test_case "a.b.c", ".", {"a","b","c"}
    return true

return M