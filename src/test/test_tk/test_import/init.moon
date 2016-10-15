M = {}
name = "test_import"
me = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = () -> 
        print me
        m = FX.tk.import me, name.."/m/m2"
        return m.hello()
    case fn, {}, "hello from m1", "numeric.range case 1"
    return true

return M