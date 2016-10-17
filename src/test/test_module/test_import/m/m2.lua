local me = ...
local M = { }
local FX = require("FunctionalX")
local m1 = FX.module.import(me, "m1")
M.hello = function()
  return m1.hello()
end
return M
