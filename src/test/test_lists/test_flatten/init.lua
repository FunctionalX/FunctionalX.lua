local name = "test_flatten"
local parent = ...
local TK = require("PackageToolkit")
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local solution = {
    1,
    2,
    3,
    'a',
    'b'
  }
  case({
    {
      1,
      2
    },
    3,
    {
      'a',
      'b'
    }
  }, solution, "case 1")
  return true
end
return M
