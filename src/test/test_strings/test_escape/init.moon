M = {}
name = "test_escape"
me = ...
FX = require "FunctionalX"

TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.strings.escape
    indent = "  "
    (case fn, 
        {"a", {}}, 
        {"a"}, 
        "strings.parseNumbers case 1"
    )
    (case fn, 
        {'"', {'"'}}, 
        {'\\"'}, 
        "strings.parseNumbers case 2"
    )
    (case fn, 
        {'"[]', {'"', '[', ']'}}, 
        {'\\"\\[\\]'}, 
        "strings.parseNumbers case 3"
    )
   
    return true

return M