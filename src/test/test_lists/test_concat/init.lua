local name = "test_concat"
local parent = ...
local TK = require("PackageToolkit")
local test_case = (require(parent .. ".test_case"))["test_case"]
local M = { }
M[name] = function()
  local solution = {
    1,
    2,
    3,
    4
  }
  test_case({
    {
      1,
      2
    },
    {
      3,
      4
    }
  }, solution, "case 1")
  return true
end
return M
