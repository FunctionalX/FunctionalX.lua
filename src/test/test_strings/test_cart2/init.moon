M = {}
me = ...
name = "test_cart2"
TK = require("PackageToolkit")
case = (require me..".case")["case"]
M[name] = -> 
    case {"a","b"}, {"1","2"}, {"a1", "a2", "b1", "b2"}, "case 1"
    return true
return M