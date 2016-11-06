package.path = package.path .. ";?/init.lua;./deps/?.lua"
local parent = "test"
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
local tests = {
  'test_strings'
}
local M = TK.module.submodules(parent, tests)
TK.test.self(M)
return M
