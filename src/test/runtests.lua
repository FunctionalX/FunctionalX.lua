package.path = package.path .. ";?/init.lua"
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
local tests = {
    "lists",
}
local parent = ...
local M = {}
TK.submodules(M, "test", tests)


TK.test(M, tests)

return M
