M = {}
name1 = "strings"
name2 = "join"
TK = require("PackageToolkit")
FX = require("FunctionalX")
M.case = (input1, input2, solution, msg="") -> 
    print TK.ui.dashed_line 80, '-'
    print string.format "test %s.%s()", name1, name2
    print msg
    print "input2", unpack input2
    result = FX[name1][name2] input1, unpack input2
    print string.format "Result: \"%s\"", result
    print string.format "Solution: \"%s\"", solution
    assert result == solution
    print "VERIFIED!"
    print TK.ui.dashed_line 80, '-'
return M