local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "..", "..", "_lists")
local tail = L.tail
local append = L.append
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      return aux(list1, (tail(list2)), (append(accum, tostring(list1[1]) .. tostring(list2[1]))))
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
