local M = { }
local TK = require("PackageToolkit")
local me = ...
local root = TK.module.root(me)
local tail = TK.module.require(root .. "._lists._tail", "tail")
local append = TK.module.require(root .. "._lists._append", "append")
local path = TK.module.require(root .. "._directory._path", "path")
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      return aux(list1, (tail(list2)), (append(accum, (path(list1[1], list2[1])))))
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
