local me = ...
print(me)
local M = { }
local FX = require("FunctionalX")
local m1 = FX.tk.import(me, "m1")
M.hello = function()
  return m1.hello()
end
return M
