TK = require "PackageToolkit"
M = {}
me = ...
name = "test_directory"
members = {
    "test_path"
    "test_cart2"
    "test_cart"
    "test_chop"
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M