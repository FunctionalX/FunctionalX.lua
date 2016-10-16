local M = { }
local name = "test_windows"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = FX.os.windows
  case(fn, { }, {
    true
  }, "numeric.range case 1")
  return true
end
return M
