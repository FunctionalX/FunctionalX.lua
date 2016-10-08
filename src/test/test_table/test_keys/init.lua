local M = { }
local name = "test_keys"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  case(FX.table.keys, {
    {
      k = 1,
      k2 = 2,
      k3 = 3
    }
  }, {
    "k",
    "k2",
    "k3"
  }, "table.keys case 1")
  case(FX.table.keys, {
    {
      1,
      ["k 2"] = 2,
      3
    }
  }, {
    1,
    2,
    "k 2"
  }, "table.keys case 2")
  return true
end
return M
