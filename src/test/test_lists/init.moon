TK = require "PackageToolkit"
M = {}
me = ...
name = "test_lists"
members = {
    "test_next",
    "test_concat",
    "test_concatn",
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M