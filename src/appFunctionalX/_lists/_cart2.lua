local M = { }
local TK = require("PackageToolkit")
local append = (TK.module.import(..., "..", "_append")).append
local tail = (TK.module.import(..., "..", "_tail")).tail
local flatten = (TK.module.import(..., "..", "_flatten")).flatten
M.cart2 = function(list1, list2, merge)
  if merge == nil then
    merge = false
  end
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      if merge then
        return aux(list1, (tail(list2)), (append(accum, (flatten(list1[1], list2[1])))))
      else
        return aux(list1, (tail(list2)), (append(accum, {
          list1[1],
          list2[1]
        })))
      end
    else
      return aux((tail(list1)), list2, (aux({
        list1[1]
      }, list2, accum)))
    end
  end
  if type(list1) ~= "table" then
    return { }
  end
  if type(list2) ~= "table" then
    return { }
  end
  return aux(list1, list2, { })
end
return M
