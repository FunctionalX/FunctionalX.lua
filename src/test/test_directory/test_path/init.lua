local name = "test_path"
local parent = ...
local TK = require("PackageToolkit")
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local separator = TK.lists.head(TK.strings.split(package.config))
  local solution = string.format("A%sB%sC", separator, separator)
  case({
    "A",
    "B",
    "C"
  }, solution, "case 1")
  return true
end
return M
