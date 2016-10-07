TK = require "PackageToolkit"
M = {}
me = ...
name = "test_table"
members = {
    "test_keys"
    "test_str"
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M