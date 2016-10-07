local M = { }
local name = "test_range"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = FX.numeric.range
  case(fn, {
    1,
    5
  }, {
    1,
    2,
    3,
    4,
    5
  }, "numeric.range case 1")
  case(fn, {
    1,
    5,
    2
  }, {
    1,
    3,
    5
  }, "numeric.range case 2")
  return true
end
return M
