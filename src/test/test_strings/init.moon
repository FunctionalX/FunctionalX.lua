parent = ...
name = "test_strings"
TK = require "PackageToolkit"
tests = {
    "test_cart2",
    "test_split",
    "test_batch_format",
}
T = TK.module.submodules(parent, tests)
M = {}
M[name] = () -> TK.test.self(T)
return M
