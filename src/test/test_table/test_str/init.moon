M = {}
name = "test_str"
me = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    indent = "  "
    (case FX.table.str, 
        {{k1:1, k2:2}}, 
        (string.format "{\n%sk1 = 1,\n%sk2 = 2\n}", indent, indent), 
        "table.str case 1"
    )
    (case FX.table.str, 
        {{["k 1"]:1, k2:2}}, 
        (string.format "{\n%s[\"k 1\"] = 1,\n%sk2 = 2\n}", indent, indent), 
        "table.str case 2"
    )
    (case FX.table.str, 
        {{["k 1"]:{h1:1, h2:2}, k2:2}}, 
        (string.format "{\n%s[\"k 1\"] = {\n%s%sh1 = 1,\n%s%sh2 = 2\n%s},\n%sk2 = 2\n}", indent, indent, indent, indent, indent, indent, indent),
        "table.str case 3"
    )
    
    (case FX.table.str, 
        {{"a 1",k2:2}}, 
        (string.format "{\n%s\"a 1\",\n%sk2 = 2\n}", indent, indent),
        "table.str case 4"
    )
    
    return true

return M