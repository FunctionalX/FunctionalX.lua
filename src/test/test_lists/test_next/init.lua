local name = "test_next"
local parent = ...
local TK = require("PackageToolkit")
local test_case = (require(parent .. ".test_case"))["test_case"]
local M = { }
M[name] = function()
  test_case({
    1,
    2
  }, 2, "case 1")
  return true
end
return M
