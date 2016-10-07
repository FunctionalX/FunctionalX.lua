local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
local L = require(root_parent .. "._lists")
local S = require(root_parent .. "._strings")
M.windows = function()
  local dir_separator = L.head(S.split(package.config))
  print(dir_separator)
  return dir_separator == '\\'
end
return M
