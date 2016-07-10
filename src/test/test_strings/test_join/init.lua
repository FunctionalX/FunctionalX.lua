local M = { }
local me = ...
local name = "test_join"
local TK = require("PackageToolkit")
local case = (require(me .. ".case"))["case"]
M[name] = function()
  case(" ", {
    1,
    2,
    3
  }, "1 2 3", "case 1")
  return true
end
return M
