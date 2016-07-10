local name = "test_take"
local me = ...
local TK = require("PackageToolkit")
local case = (require(me .. ".case"))["case"]
local M = { }
M[name] = function()
  case(0, {
    1
  }, { }, "case 0")
  case(1, {
    1
  }, {
    1
  }, "case 1")
  case(2, {
    1
  }, {
    1
  }, "case 2")
  case(2, { }, { }, "case 3")
  return true
end
return M
