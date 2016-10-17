local M = { }
local T = (require("PackageToolkit")).module
local runmodule = (T.import(..., "_runmodule")).runmodule
M.call = function(modules, ...)
  return runmodule(modules, false, ...)
end
return M
