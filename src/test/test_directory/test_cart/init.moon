M = {}
name = "test_cart"
me = ...
TK = require("PackageToolkit")
case = (require me..".case")["case"]
M[name] = -> 
    separator = TK.lists.head TK.strings.split package.config
    s1 = string.format "A%s1%sa", separator, separator
    s2 = string.format "A%s2%sa", separator, separator
    s3 = string.format "B%s1%sa", separator, separator
    s4 = string.format "B%s2%sa", separator, separator
    solution = {s1, s2, s3, s4}
    case {{"A", "B"}, {1,2}, {"a"}}, solution, "case 1"
    return true

return M