M = {}
name1 = "lists"
name2 = "cart"
TK = require("PackageToolkit")
FX = require("FunctionalX")
M.case = (input, solution, msg="") -> 
    print TK.ui.dashed_line 80, '-'
    print string.format "test %s.%s()", name1, name2
    print msg
    result = FX[name1][name2] unpack input
    for r in *result
        print "Result: ", unpack r
    assert TK.test.equal_lists result, solution
    print "VERIFIED!"
    print TK.ui.dashed_line 80, '-'
return M