local TK = require("PackageToolkit")
local M = { }
local me = ...
local name = "test_numeric"
local members = {
  "test_range",
  "test_indices"
}
local T = TK.module.submodules(me, members)
M[name] = function()
  return TK.test.self(T)
end
return M
