local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local append = TK.module.require(root_parent .. "._lists._append", "append")
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      local condition1 = (type(list1[1])) ~= "string"
      local condition2 = (type(list2[1])) ~= "string"
      if condition1 or condition2 then
        return {
          "strings.cart2() ERROR HINT: input cannot be list of lists"
        }
      end
      return aux(list1, (tail(list2)), (append(accum, list1[1] .. list2[1])))
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
