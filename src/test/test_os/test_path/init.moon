M = {}
name = "test_path"
me = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.os.path
    print fn "HOME"
    print "---------------------"
    return true

return M