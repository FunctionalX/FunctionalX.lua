name = "test_directory"
tests = {
    "test_path"
}
parent = ...
TK = require "PackageToolkit"
T = TK.module.submodules(parent, tests)
M = {}
M[name] = () -> TK.test.self(T)
return M