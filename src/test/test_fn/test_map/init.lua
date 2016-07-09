local name = "test_map"
local me = ...
local TK = require("PackageToolkit")
local case = (require(me .. ".case"))["case"]
local M = { }
M[name] = function()
  local add1
  add1 = function(a)
    return a + 1
  end
  case(add1, {
    10,
    20,
    30
  }, {
    11,
    21,
    31
  }, "case 1")
  return true
end
return M
