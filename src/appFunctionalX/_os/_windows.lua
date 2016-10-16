local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "..", "..", "_lists")
local S = T.import(..., "..", "..", "_strings")
M.windows = function()
  local dir_separator = L.head(S.split(package.config))
  return dir_separator == '\\'
end
return M
