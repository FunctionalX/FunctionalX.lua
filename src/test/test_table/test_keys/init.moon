M = {}
name = "test_keys"
me = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    t = {k:1, k2:2, k3:3}
    case FX.table.keys, {t}, {"k", "k2", "k3"}, "case 1"
    return true

return M