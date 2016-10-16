parent = ...
TK = require("PackageToolkit")
case = (require parent..".case")["case"]
M = {}
M.test_split = -> 
    case "a.b.c", ".", {"a","b","c"}
    case "a", ".", {"a"}
    case "", ".", {}
    return true

return M