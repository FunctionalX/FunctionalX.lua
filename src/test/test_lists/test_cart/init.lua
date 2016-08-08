local name = "test_cart"
local parent = ...
local TK = require("PackageToolkit")
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local solution = {
    {
      1,
      3,
      'a'
    },
    {
      1,
      3,
      'b'
    },
    {
      1,
      4,
      'a'
    },
    {
      1,
      4,
      'b'
    },
    {
      2,
      3,
      'a'
    },
    {
      2,
      3,
      'b'
    },
    {
      2,
      4,
      'a'
    },
    {
      2,
      4,
      'b'
    }
  }
  case({
    {
      1,
      2
    },
    {
      3,
      4
    },
    {
      'a',
      'b'
    }
  }, solution, "case 1")
  return true
end
return M
