M = {}
name1 = "lists"
name2 = "next"
TK = require("PackageToolkit")
FX = require("FunctionalX")
M.case = (input, solution, msg="") -> 
    print TK.ui.dashed_line 80, '-'
    print string.format "test %s.%s()", name1, name2
    print msg
    assert (FX[name1][name2] input) == solution
    print "VERIFIED!"
    print TK.ui.dashed_line 80, '-'
return M