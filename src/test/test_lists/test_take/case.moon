M = {}
name1 = "lists"
name2 = "take"
TK = require("PackageToolkit")
FX = require("FunctionalX")
M.case = (input1, input2, solution, msg="") -> 
    print TK.ui.dashed_line 80, '-'
    print string.format "test %s.%s()", name1, name2
    print msg
    result = FX[name1][name2] input1, input2
    print "Result: ", unpack result
    print "Solution: ", unpack solution
    assert TK.test.equal_lists result, solution
    print "VERIFIED!"
    print TK.ui.dashed_line 80, '-'
return M