local M = { }
local name = "test_indices"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = FX.numeric.indices
  case(fn, {
    3
  }, {
    {
      1,
      2,
      3
    }
  }, "numeric.indices case 1")
  case(fn, {
    3,
    1,
    2
  }, {
    {
      1,
      2
    }
  }, "numeric.indices case 2")
  case(fn, {
    3,
    "1 2"
  }, {
    {
      1,
      2
    }
  }, "numeric.indices case 3")
  case(fn, {
    10,
    "1-4 5 6-8"
  }, {
    {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8
    }
  }, "numeric.indices case 4")
  return true
end
return M
