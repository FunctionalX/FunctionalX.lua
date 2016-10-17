local M = { }
local T = (require("PackageToolkit")).module
local runmodule = (T.import(..., "_runmodule")).runmodule
M.run = function(modules, ...)
  return runmodule(modules, true, ...)
end
return M
