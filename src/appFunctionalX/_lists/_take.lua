local M = { }
local TK = require("PackageToolkit")
local append = (TK.module.import(..., "..", "_append")).append
local tail = (TK.module.import(..., "..", "_tail")).tail
local head = (TK.module.import(..., "..", "_head")).head
M.take = function(n, list)
  if (type(list)) ~= "table" then
    return { }
  end
  local aux
  aux = function(n, list, accum)
    if n == 0 then
      return accum
    elseif #list == 0 then
      return accum
    else
      return aux((n - 1), (tail(list)), (append(accum, (head(list)))))
    end
  end
  return aux(n, list, { })
end
return M
