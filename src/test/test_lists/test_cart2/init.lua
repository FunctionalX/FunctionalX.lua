local name = "test_cart2"
local parent = ...
local TK = require("PackageToolkit")
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local solution = {
    {
      1,
      3
    },
    {
      1,
      4
    },
    {
      2,
      3
    },
    {
      2,
      4
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
    }
  }, solution, "case 1")
  solution = {
    {
      1,
      2,
      'a'
    },
    {
      1,
      2,
      'b'
    },
    {
      3,
      'a'
    },
    {
      3,
      'b'
    }
  }
  case({
    {
      {
        1,
        2
      },
      3
    },
    {
      'a',
      'b'
    },
    true
  }, solution, "case 2")
  return true
end
return M
