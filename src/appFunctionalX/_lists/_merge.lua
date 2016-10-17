local M = { }
local TK = require("PackageToolkit")
local tail = (TK.module.import(..., "_tail")).tail
local merge2 = (TK.module.import(..., "_merge2")).merge2
M.merge = function(...)
  local tables = {
    ...
  }
  local aux
  aux = function(tables, accum)
    if #tables == 0 then
      return accum
    else
      return (aux((tail(tables)), (merge2(accum, tables[1]))))
    end
  end
  if #tables == 0 then
    return { }
  elseif #tables == 1 then
    return tables[1]
  else
    return aux(tables, { })
  end
end
return M
