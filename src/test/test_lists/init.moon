parent = ...
TK = require "PackageToolkit"
tests = {
    "test_next",
    "test_concat",
    "test_concatn",
}
T = TK.module.submodules(parent, tests)
M = {}
M.test_lists = () -> TK.test.self(T)
return M