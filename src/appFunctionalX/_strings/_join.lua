local M = { }
local T = require("PackageToolkit").module
local head = (T.import(..., "..", "..", "_lists", "_head")).head
local tail = (T.import(..., "..", "..", "_lists", "_tail")).tail
M.join = function(...)
  local args = {
    ...
  }
  local separator = head(args)
  local list = tail(args)
  local aux
  aux = function(list, accum)
    if #list == 0 then
      return accum
    else
      return aux((tail(list)), accum .. separator .. (tostring(head(list))))
    end
  end
  if #list == 0 then
    return ""
  end
  return aux((tail(list)), (tostring(head(list))))
end
return M
