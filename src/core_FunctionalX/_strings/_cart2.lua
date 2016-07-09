local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
local L = require(root_parent .. "._lists")
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      return aux(list1, (L.tail(list2)), (L.append(accum, list1[1] .. list2[1])))
    else
      return aux((L.tail(list1)), list2, (aux({
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
