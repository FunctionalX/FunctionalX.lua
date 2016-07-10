M = {}
name = "test_cart2"
me = ...
TK = require("PackageToolkit")
case = (require me..".case")["case"]
M[name] = -> 
    separator = TK.lists.head TK.strings.split package.config
    s1 = string.format "A%s1", separator
    s2 = string.format "A%s2", separator
    s3 = string.format "B%s1", separator
    s4 = string.format "B%s2", separator
    solution = {s1, s2, s3, s4}
    case {"A", "B"}, {1,2}, solution, "case 1"
    return true

return M