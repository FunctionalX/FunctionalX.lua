M = {}
name = "test_run"
FX = require "FunctionalX"
TK = require("PackageToolkit")
m1 = FX.module.initimport ..., "m1"
m2 = FX.module.initimport ..., "m2"
m3 = FX.module.initimport ..., "m3"
m4 = FX.module.initimport ..., "m4"
case = TK.test.case
M[name] = -> 
    fn1 = FX.module.call 
    fn2 = FX.module.run
    print fn1
    print fn2
    case fn1, {{m1}}, {{"m1"}}, "module.run case 1"
    case fn1, {{m1}, "9999"}, {{}}, "module.run case 2" -- test error handling
    case fn1, {{m1, m2}, "1"}, {{"m1"}}, "module.run case 3" 
    case fn1, {{m1, m2}, "2"}, {{"m2"}}, "module.run case 4" 
    case fn1, {{m1, m2}, "1 2"}, {{"m1", "m2"}}, "module.run case 5" 
    case fn1, {{m1, m2, m3}, "3,1"}, {{"n1"}}, "module.run case 6" 
    case fn1, {{m1, m2, m4}, "3,1,1,1"}, {{"hello 1"}}, "module.run case 7" 
    case fn1, {{m1, m2, m4}, "1 3,1,1,2"}, {{"m1", "hello 2"}}, "module.run case 8" 
    return true

return M