M = {}
name = "test_trim"
me = ...
FX = require "FunctionalX"

TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.strings.trim
    (case fn, 
        {" a ", "%s"}, 
        {"a"}, 
        "strings.trim case 1"
    )

    (case fn, 
        {"\n \t \r a \n \t \r", "%s"}, 
        {"a"}, 
        "strings.trim case 2"
    )

    (case fn, 
        {"\n \t \r a b \n \t \r", "%s"}, 
        {"a b"}, 
        "strings.trim case 3"
    )

    (case fn, 
        {"{a}", "[{}]"}, 
        {"a"}, 
        "strings.trim case 4"
    )
    return true

return M