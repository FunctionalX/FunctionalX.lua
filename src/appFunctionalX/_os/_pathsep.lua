local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "../_lists")
local S = T.import(..., "../_strings")
M.pathsep = function()
  return L.head(S.split(package.config))
end
return M
