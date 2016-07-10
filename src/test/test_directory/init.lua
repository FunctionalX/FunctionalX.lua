local TK = require("PackageToolkit")
local M = { }
local me = ...
local name = "test_directory"
local members = {
  "test_path",
  "test_cart2"
}
local T = TK.module.submodules(me, members)
M[name] = function()
  return TK.test.self(T)
end
return M
