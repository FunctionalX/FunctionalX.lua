package.path = package.path .. ";?/init.lua"
local parent = "test"
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
local tests = {
  "test_tk"
}
local M = TK.module.submodules(parent, tests)
TK.test.self(M)
return M
