local M = { }
local TK = require("PackageToolkit")
local head = (TK.module.import(..., "..", "_head")).head
local tail = (TK.module.import(..., "..", "_tail")).tail
local append = (TK.module.import(..., "..", "_append")).append
M.flatten = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(lists, accum)
    if #lists == 0 then
      return accum
    elseif (type(lists[1])) == "table" then
      return aux((tail(lists)), (aux(lists[1], accum)))
    else
      return aux((tail(lists)), (append(accum, lists[1])))
    end
  end
  return aux(args, { })
end
return M
