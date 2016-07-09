parent = ...
TK = require("PackageToolkit")
case = (require parent..".case")["case"]
M = {}
M.test_cart2 = -> 
    case {"a","b"}, {"1","2"}, {"a1", "a2", "b1", "b2"}, "case 1"
    return true

return M