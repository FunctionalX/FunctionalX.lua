parent = ...
TK = require "PackageToolkit"
tests = {
    "test_next"
}
T = TK.submodules(parent, tests)
M = {}
M.test_lists = () -> TK.test_module(T)
return M