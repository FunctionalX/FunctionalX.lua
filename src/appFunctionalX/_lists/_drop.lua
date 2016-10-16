local M = { }
local TK = require("PackageToolkit")
local tail = (TK.module.import(..., "..", "_tail")).tail
M.drop = function(n, list)
  if (type(list)) ~= "table" then
    return { }
  end
  local aux
  aux = function(n, list)
    if n == 0 then
      return list
    elseif #list == 0 then
      return { }
    else
      return aux((n - 1), (tail(list)))
    end
  end
  return aux(n, list, { })
end
return M
