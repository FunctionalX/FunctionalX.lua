package.path = package.path .. ";?/init.lua"
parent = "test"
TK = require "PackageToolkit"
FX = require "FunctionalX"
tests = {
    "test_lists"
    'test_strings'
    "test_directory"
    "test_fn"
    "test_table"
}
M = TK.module.submodules parent, tests

TK.test.self M

return M
