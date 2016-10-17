local M = { }
local me = ...
local FX = require("FunctionalX")
local T = (require("PackageToolkit")).module
M.main = function(...)
  local m = {
    T.import(me, "p1")
  }
  return unpack((FX.module.run(m, ...)))
end
return M
