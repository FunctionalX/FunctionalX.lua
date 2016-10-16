local TK = require("PackageToolkit")
local M = { }
local tail = (TK.module.import(..., '..', "..", '_lists', '_tail')).tail
local head = (TK.module.import(..., '..', "..", '_lists', '_head')).head
local append = (TK.module.import(..., '..', '..', '_lists', '_append')).append
M.map = function(f, list)
  local aux
  aux = function(f, list, accum)
    if #list == 0 then
      return accum
    else
      return aux(f, (tail(list)), (append(accum, (f((head(list)))))))
    end
  end
  if (type(list)) ~= "table" then
    return { }
  end
  return aux(f, list, { })
end
return M
