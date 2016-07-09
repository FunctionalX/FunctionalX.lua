local parent = ...
local TK = require("PackageToolkit")
local case = (require(parent .. ".case"))["case"]
local M = { }
M.test_cart2 = function()
  case({
    "a",
    "b"
  }, {
    "1",
    "2"
  }, {
    "a1",
    "a2",
    "b1",
    "b2"
  }, "case 1")
  return true
end
return M
