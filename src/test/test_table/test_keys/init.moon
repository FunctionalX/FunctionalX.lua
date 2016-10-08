M = {}
name = "test_keys"
me = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    case FX.table.keys, {{k:1, k2:2, k3:3}}, {"k", "k2", "k3"}, "table.keys case 1"
    case FX.table.keys, {{1, ["k 2"]:2, 3}}, {1,2,"k 2"}, "table.keys case 2"

    return true

return M