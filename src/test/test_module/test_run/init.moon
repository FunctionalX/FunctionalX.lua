M = {}
name = "test_run"
FX = require "FunctionalX"
TK = require("PackageToolkit")
m1 = TK.module.import ..., "m1"
m2 = TK.module.import ..., "m2"
m3 = TK.module.import ..., "m3"
m4 = TK.module.import ..., "m4"
case = TK.test.case
M[name] = -> 
    fn = FX.module.run
    case fn, {{m1}}, {{"m1"}}, "module.run case 1"
    case fn, {{m1}, "9999"}, {{}}, "module.run case 2" -- test error handling
    case fn, {{m1, m2}, "1"}, {{"m1"}}, "module.run case 3" 
    case fn, {{m1, m2}, "2"}, {{"m2"}}, "module.run case 4" 
    case fn, {{m1, m2}, "1 2"}, {{"m1", "m2"}}, "module.run case 5" 
    case fn, {{m1, m2, m3}, "3,1"}, {{"n1"}}, "module.run case 6" 
    case fn, {{m1, m2, m4}, "3,1,1"}, {{"p1"}}, "module.run case 7" 
    case fn, {{m1, m2, m4}, "1 3,1,1"}, {{"m1", "p1"}}, "module.run case 8" 
    return true

return M