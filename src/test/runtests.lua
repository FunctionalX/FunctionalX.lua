package.path = package.path .. ";?/init.lua"
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
local tests = {
    "test_lists",
}
local parent = "test"
local M = TK.submodules(parent, tests)

for k, v in pairs(M.test_lists) do
    print(k,v)
end
TK.test_module(M)

return M
