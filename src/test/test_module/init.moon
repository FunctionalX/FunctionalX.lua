TK = require "PackageToolkit"
M = {}
me = ...
name = "test_module"
members = {
    -- "test_import"
    "test_run"
}
T = TK.module.submodules me, members
M[name] = () -> TK.test.self T
return M