TK = require "PackageToolkit"
M = {}
me = ...
name = "test_fn"
members = {
    "test_map",
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M