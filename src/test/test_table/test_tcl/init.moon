M = {}
name = "test_tcl"
me = ...
FX = require "FunctionalX"

TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.table.tcl
    indent = "  "
    (case fn, 
        {{k1:1, k2:2}, true}, 
        {(string.format "{\n%sk1 1\n%sk2 2\n}", indent, indent)}, 
        "table.tcl case 1"
    )
    (case fn, 
        {{["k 1"]:1, k2:2}, true}, 
        {(string.format "{\n%s\"k 1\" 1\n%sk2 2\n}", indent, indent)}, 
        "table.tcl case 2"
    )
    (case fn, 
        {{["k 1"]:{h1:1, h2:2}, k2:2}, true}, 
        {(string.format "{\n%s\"k 1\" {\n%s%sh1 1\n%s%sh2 2\n%s}\n%sk2 2\n}", indent, indent, indent, indent, indent, indent, indent)},
        "table.tcl case 3"
    )
    (case fn,
        {{a:1}, false},
        {"{ a 1 }"},
        "table.tcl case 4")
    return true

return M