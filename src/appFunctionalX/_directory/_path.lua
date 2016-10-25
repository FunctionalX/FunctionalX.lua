local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "../_lists")
local S = T.import(..., "../_strings")
M.path = function(...)
  local dir_separator = L.head((S.split(package.config, "%s")))
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
