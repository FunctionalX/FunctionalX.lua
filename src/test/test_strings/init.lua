local parent = ...
local TK = require("PackageToolkit")
local tests = {
  "test_cart2"
}
local T = TK.submodules(parent, tests)
local M = { }
M.test_lists = function()
  return TK.test_module(T)
end
return M
