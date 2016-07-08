parent = ...
TK = require("PackageToolkit")
test_case = (require parent..".test_case")["test_case"]
M = {}
M.test_batch_format = -> 
    test_case "p%s", {1,2,3}, {"p1","p2","p3"}
    return true

return M