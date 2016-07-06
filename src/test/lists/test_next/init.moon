M = {}
TK = require("PackageToolkit")
test = (input, solution) -> 
    print TK.dashed_line 80, '-'
    print "test next()"
    assert (next input) == solution
    print "VERIFIED!"
    print TK.dashed_line 90, '-'

M.test_next = -> return test {1,2}, 1

return M