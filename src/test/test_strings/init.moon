TK = require "PackageToolkit"
M = {}
me = ...
name = "test_strings"
members = {
    "test_cart2",
    "test_split",
    "test_batch_format",
    "test_join",
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M