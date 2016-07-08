name = "test_directory"
tests = {
    "test_path"
}
parent = ...
TK = require "PackageToolkit"
T = TK.submodules(parent, tests)
M = {}
M[name] = () -> TK.test_module(T)
return M