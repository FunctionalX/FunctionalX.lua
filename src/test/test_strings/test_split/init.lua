local parent = ...
local TK = require("PackageToolkit")
local test_case = (require(parent .. ".test_case"))["test_case"]
local M = { }
M.test_split = function()
  test_case("a.b.c", ".", {
    "a",
    "b",
    "c"
  })
  return true
end
return M
