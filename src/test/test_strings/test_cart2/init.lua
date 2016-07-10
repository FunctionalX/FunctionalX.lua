local M = { }
local me = ...
local name = "test_cart2"
local TK = require("PackageToolkit")
local case = (require(me .. ".case"))["case"]
M[name] = function()
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
  case({
    {
      "a"
    }
  }, {
    "b"
  }, {
    "strings.cart2() ERROR HINT: input cannot be list of lists"
  }, "case error handling")
  return true
end
return M
