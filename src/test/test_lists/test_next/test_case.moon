M = {}
TK = require("PackageToolkit")
FX = require("FunctionalX")
M.test_case = (input, solution, msg="") -> 
    print TK.dashed_line 80, '-'
    print "test next()"
    print msg
    assert (FX.lists.next input) == solution
    print "VERIFIED!"
    print TK.dashed_line 80, '-'
return M