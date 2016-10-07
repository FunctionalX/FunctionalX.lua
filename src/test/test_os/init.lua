local TK = require("PackageToolkit")
local M = { }
local me = ...
local name = "test_os"
local members = {
  "test_windows"
}
local T = TK.module.submodules(me, members)
M[name] = function()
  return TK.test.self(T)
end
return M
