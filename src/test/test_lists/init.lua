local TK = require("PackageToolkit")
local M = { }
local me = ...
local name = "test_lists"
local members = {
  "test_next",
  "test_concat",
  "test_concatn",
  "test_take"
}
local T = TK.module.submodules(me, members)
M[name] = function()
  return TK.test.self(T)
end
return M
