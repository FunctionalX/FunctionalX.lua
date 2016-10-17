M = {}
name = "test_parseNumbers"
me = ...
FX = require "FunctionalX"

TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.strings.parseNumbers
    indent = "  "
    (case fn, 
        {","}, 
        {{},{}}, 
        "strings.parseNumbers case 1"
    )
    (case fn, 
        {",", "1"}, 
        {{1},{}}, 
        "strings.parseNumbers case 2"
    )
    (case fn, 
        {",", "1,2"}, 
        {{1},{"2"}}, 
        "strings.parseNumbers case 3"
    )
    (case fn, 
        {",", "1 2,3"}, 
        {{1,2},{"3"}}, 
        "strings.parseNumbers case 4"
    )
    (case fn, 
        {",", "1,2 3"}, 
        {{1},{"2 3"}}, 
        "strings.parseNumbers case 5"
    )
    (case fn, 
        {",", "1 2"}, 
        {{1, 2},{}}, 
        "strings.parseNumbers case 6"
    )
    
    (case fn, 
        {",", "1,2, 3"}, 
        {{1},{"2, 3"}}, 
        "strings.parseNumbers case 7"
    )
        
    (case fn, 
        {",", " 1"}, 
        {{1},{}}, 
        "strings.parseNumbers case 8"
    )

    (case fn, -- preserve spaces
        {",", "1,  3"}, 
        {{1},{"  3"}}, 
        "strings.parseNumbers case 9"
    )
    
    return true

return M