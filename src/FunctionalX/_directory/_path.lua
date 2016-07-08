local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module_root(parent)
local L = require(root_parent .. "._lists")
local S = require(root_parent .. "._strings")
M.path = function(...)
  print("input to path: ", ...)
  local dir_separator = L.head(S.split(package.config))
  local aux
  aux = function(subdirs, accum)
    if #subdirs == 0 then
      return accum
    else
      return aux((L.tail(subdirs)), accum .. dir_separator .. tostring(subdirs[1]))
    end
  end
  local args = {
    ...
  }
  if #args == 0 then
    return ""
  end
  if #args == 1 then
    return args[1]
  end
  return aux((L.tail(args)), (tostring(args[1])))
end
return M
