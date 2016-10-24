TK = require "PackageToolkit"
M = {}
me = ...
name = "test_os"
members = {
    "test_windows"
    "test_path"
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M