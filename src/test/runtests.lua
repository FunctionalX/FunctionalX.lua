package.path = package.path .. ";?/init.lua"
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
local tests = {
    "lists",
}
local parent = "test"
local M = TK.submodules(parent, tests)

print(require("test.lists"))
for k, v in pairs(M) do
    print(k,v)
end
-- TK.test_all(M["lists"])

return M
