local name = "test_concatn"
local parent = ...
local TK = require("PackageToolkit")
local test_case = (require(parent .. ".test_case"))["test_case"]
local M = { }
M[name] = function()
  local solution = {
    1,
    2,
    3,
    4,
    5
  }
  test_case({
    {
      1,
      2
    },
    {
      3,
      4
    },
    {
      5
    }
  }, solution, "case 1")
  return true
end
return M
