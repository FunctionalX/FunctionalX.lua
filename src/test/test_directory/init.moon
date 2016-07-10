TK = require "PackageToolkit"
M = {}
me = ...
name = "test_directory"
members = {
    "test_path",
    "test_cart2",
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M