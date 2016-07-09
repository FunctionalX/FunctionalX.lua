local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
local append = TK.module.require(root_parent .. "._lists._append", "append")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      return aux(list1, (tail(list2)), (append(accum, {
        list1[1],
        list2[1]
      })))
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