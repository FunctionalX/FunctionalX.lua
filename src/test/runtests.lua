package.path = package.path .. ";?/init.lua"
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
local tests = {
    "test_lists",
    'test_strings',
}
local parent = "test"
local M = TK.submodules(parent, tests)

TK.test_module(M)

return M
