local name = "test_drop"
local me = ...
local TK = require("PackageToolkit")
local case = (require(me .. ".case"))["case"]
local M = { }
M[name] = function()
  case(0, { }, { }, "case 0")
  case(0, {
    1
  }, {
    1
  }, "case 1")
  case(1, {
    1
  }, { }, "case 2")
  case(2, {
    1
  }, { }, "case 3")
  case(2, {
    1,
    2
  }, { }, "case 4")
  case(2, {
    1,
    2,
    3
  }, {
    3
  }, "case 5")
  case(2, {
    1,
    2,
    3,
    4
  }, {
    3,
    4
  }, "case 6")
  return true
end
return M
