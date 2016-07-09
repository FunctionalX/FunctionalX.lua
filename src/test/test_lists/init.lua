local parent = ...
local TK = require("PackageToolkit")
local tests = {
  "test_next",
  "test_concat",
  "test_concatn"
}
local T = TK.module.submodules(parent, tests)
local M = { }
M.test_lists = function()
  return TK.test.self(T)
end
return M
