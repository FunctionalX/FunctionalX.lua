local TK = require("PackageToolkit")
local M = { }
local me = ...
local name = "test_fn"
local members = {
  "test_map"
}
local T = TK.module.submodules(me, members)
M[name] = function()
  return TK.test.self(T)
end
return M
