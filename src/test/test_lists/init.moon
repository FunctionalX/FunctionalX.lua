TK = require "PackageToolkit"
M = {}
me = ...
name = "test_lists"
members = {
    "test_next",
    "test_concat",
    "test_concatn",
    "test_take",
    'test_drop',
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M