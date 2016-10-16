local M = { }
local TK = require("PackageToolkit")
local append = (TK.module.import(..., "..", "_append")).append
local tail = (TK.module.import(..., "..", "_tail")).tail
M.replicate = function(n, item)
  local aux
  aux = function(n, item, accum)
    if n <= 0 then
      return accum
    else
      return aux((n - 1), item, (append(accum, item)))
    end
  end
  return aux(n, item, { })
end
return M
