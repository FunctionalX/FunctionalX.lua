local parent = ...
local TK = require("PackageToolkit")
local tests = {
  "test_cart2",
  "test_split",
  "test_batch_format"
}
local T = TK.submodules(parent, tests)
local M = { }
M.test_strings = function()
  return TK.test_module(T)
end
return M