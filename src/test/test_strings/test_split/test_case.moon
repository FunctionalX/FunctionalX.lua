M = {}
TK = require("PackageToolkit")
FX = require("FunctionalX")
M.test_case = (input1, input2, solution, msg="") -> 
    print TK.dashed_line 80, '-'
    print "test strings.split()"
    print msg
    result = FX.strings.split input1, input2
    print "Result: ", unpack result
    assert TK.equal_lists result, solution
    print "VERIFIED!"
    print TK.dashed_line 80, '-'
return M