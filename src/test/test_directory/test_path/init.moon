name = "test_path"
parent = ...
TK = require("PackageToolkit")
test_case = (require parent..".test_case")["test_case"]
M = {}
M[name] = -> 
    separator = TK.head TK.split package.config
    solution = string.format "A%sB%sC", separator, separator
    test_case {"A", "B", "C"}, solution, "case 1"
    return true

return M