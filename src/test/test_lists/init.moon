TK = require "PackageToolkit"
M = {}
me = ...
name = "test_lists"
members = {
    "test_next"
    "test_concat2"
    "test_concat"
    "test_take"
    "test_drop"
    "test_cart2"
    "test_cart"
    "test_flatten"
    "test_merge2"
    "test_merge"
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M