local name = "test_next"
local parent = ...
local TK = require("PackageToolkit")
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  case({
    1,
    2
  }, 2, "case 1")
  return true
end
return M
