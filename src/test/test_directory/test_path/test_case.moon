M = {}
TK = require("PackageToolkit")
FX = require("FunctionalX")
M.test_case = (input1, solution, msg="") -> 
    print TK.dashed_line 80, '-'
    print "test strings.path()"
    print msg, unpack input1
    result = FX.directory.path unpack input1
    print "Result: ", result
    assert result == solution
    print "VERIFIED!"
    print TK.dashed_line 80, '-'
return M