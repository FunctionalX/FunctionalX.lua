local parent = ...
local TK = require("PackageToolkit")
local case = (require(parent .. ".case"))["case"]
local M = { }
M.test_split = function()
  case("a.b.c", ".", {
    "a",
    "b",
    "c"
  })
  case("a", ".", {
    "a"
  })
  case("", ".", { })
  return true
end
return M
