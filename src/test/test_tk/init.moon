TK = require "PackageToolkit"
M = {}
me = ...
name = "test_tk"
members = {
    "test_import"
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M