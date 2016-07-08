local name = "test_path"
local parent = ...
local TK = require("PackageToolkit")
local test_case = (require(parent .. ".test_case"))["test_case"]
local M = { }
M[name] = function()
  local separator = TK.head(TK.split(package.config))
  local solution = string.format("A%sB%sC", separator, separator)
  test_case({
    "A",
    "B",
    "C"
  }, solution, "case 1")
  return true
end
return M
