M = {}
name = "test_parseFirstNumberGroup"
me = ...
FX = require "FunctionalX"

TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.strings.parseFirstNumberGroup
    indent = "  "
    (case fn, 
        {}, 
        {{},""}, 
        "strings.parseFirstNumberGroup case 1"
    )
    (case fn, 
        {"1"}, 
        {{1},""}, 
        "strings.parseFirstNumberGroup case 2"
    )
    (case fn, 
        {"1,2", ","}, 
        {{1},"2"}, 
        "strings.parseFirstNumberGroup case 3"
    )
    (case fn, 
        {"1 2,3"}, 
        {{1,2},"3"}, 
        "strings.parseFirstNumberGroup case 4"
    )
    (case fn, 
        {"1,2 3"}, 
        {{1},"2 3"}, 
        "strings.parseFirstNumberGroup case 5"
    )
    (case fn, 
        {"1 2"}, 
        {{1, 2},""}, 
        "strings.parseFirstNumberGroup case 6"
    )
    
    (case fn, 
        {"1,2, 3"}, 
        {{1},"2, 3"}, 
        "strings.parseFirstNumberGroup case 7"
    )
        
    (case fn, 
        {" 1"}, 
        {{1},""}, 
        "strings.parseFirstNumberGroup case 8"
    )

    (case fn, -- preserve spaces
        {"1,  3"}, 
        {{1},"  3"}, 
        "strings.parseFirstNumberGroup case 9"
    )
    
    (case fn, 
        {"2,1,1"}, 
        {{2},"1,1"}, 
        "strings.parseFirstNumberGroup case 10"
    )
    
    return true

return M