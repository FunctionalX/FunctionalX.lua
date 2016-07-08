M = {}
TK = require("PackageToolkit")
FX = require("FunctionalX")
M.test_case = (input1, solution, msg="") -> 
    print TK.dashed_line 80, '-'
    print "test lists.concatn()"
    print msg
    result = FX.lists.concatn unpack input1
    print "Result: ", unpack result
    assert TK.equal_lists result, solution
    print "VERIFIED!"
    print TK.dashed_line 80, '-'
return M