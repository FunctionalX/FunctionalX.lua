local parent = ...
local name = "test_strings"
local TK = require("PackageToolkit")
local tests = {
  "test_cart2",
  "test_split",
  "test_batch_format"
}
local T = TK.module.submodules(parent, tests)
local M = { }
M[name] = function()
  return TK.test.self(T)
end
return M
