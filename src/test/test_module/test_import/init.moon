M = {}
name = "test_import"
me = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = () -> 
        print me
        m = FX.module.initimport me, 'm/m2'
        return m.hello()
    case fn, {}, {"hello from m1"}, "numeric.range case 1"
    print "----------------------------"
    print FX.module.fpath("module1")
    print "----------------------------"
    return true

return M