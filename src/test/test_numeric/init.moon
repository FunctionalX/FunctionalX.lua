TK = require "PackageToolkit"
M = {}
me = ...
name = "test_numeric"
members = {
    "test_range"
    "test_indices"
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M