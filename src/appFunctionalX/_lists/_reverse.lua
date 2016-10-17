local M = { }
local TK = require("PackageToolkit")
local prepend = (TK.module.import(..., "_prepend")).prepend
local tail = (TK.module.import(..., "_tail")).tail
M.reverse = function(list)
  local aux
  aux = function(list, accum)
    if #list == 0 then
      return accum
    else
      return aux((tail(list)), (prepend(list[1], accum)))
    end
  end
  return aux(list, { })
end
return M
