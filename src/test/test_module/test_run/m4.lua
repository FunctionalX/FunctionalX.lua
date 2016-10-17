local M = { }
local me = ...
local FX = require("FunctionalX")
local T = (require("PackageToolkit")).module
M.main = function(...)
  local m = {
    T.import(me, "n2")
  }
  return unpack((FX.module.call(m, ...)))
end
return M
