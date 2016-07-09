name = "test_path"
me = ...
TK = require("PackageToolkit")
case = (require me..".case")["case"]
M = {}
M[name] = -> 
    separator = TK.lists.head TK.strings.split package.config
    solution = string.format "A%sB%sC", separator, separator
    case {"A", "B", "C"}, solution, "case 1"
    return true

return M