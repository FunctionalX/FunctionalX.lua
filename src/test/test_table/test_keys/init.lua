local M = { }
local name = "test_keys"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local t = {
    k = 1,
    k2 = 2,
    k3 = 3
  }
  case(FX.table.keys, {
    t
  }, {
    "k",
    "k2",
    "k3"
  }, "table.keys case 1")
  return true
end
return M
