parent = ...
TK = require "PackageToolkit"
tests = {
    "test_cart2",
    "test_split",
    "test_batch_format",
}
T = TK.submodules(parent, tests)
M = {}
M.test_strings = () -> TK.test_module(T)
return M
