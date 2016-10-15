local M = { }
local name = "test_import"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn
  fn = function()
    print(me)
    local m = FX.tk.import(me, name .. "/m/m2")
    return m.hello()
  end
  case(fn, { }, "hello from m1", "numeric.range case 1")
  return true
end
return M
