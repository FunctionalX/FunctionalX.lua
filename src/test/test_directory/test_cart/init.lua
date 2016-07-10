local M = { }
local name = "test_cart"
local me = ...
local TK = require("PackageToolkit")
local case = (require(me .. ".case"))["case"]
M[name] = function()
  local separator = TK.lists.head(TK.strings.split(package.config))
  local s1 = string.format("A%s1%sa", separator, separator)
  local s2 = string.format("A%s2%sa", separator, separator)
  local s3 = string.format("B%s1%sa", separator, separator)
  local s4 = string.format("B%s2%sa", separator, separator)
  local solution = {
    s1,
    s2,
    s3,
    s4
  }
  case({
    {
      "A",
      "B"
    },
    {
      1,
      2
    },
    {
      "a"
    }
  }, solution, "case 1")
  return true
end
return M
