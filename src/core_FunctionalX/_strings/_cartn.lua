local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local cart2 = TK.module.require(root_parent .. "._strings._cart2", "cart2")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.cartn = function(...)
  local aux
  aux = function(list1, other_lists)
    if #other_lists == 0 then
      return list1
    else
      if type(other_lists[1]) ~= "table" then
        return aux(list1, { })
      end
      return aux((cart2(list1, other_lists[1])), (tail(other_lists)))
    end
  end
  local args = {
    ...
  }
  if type(args) ~= "table" then
    return { }
  end
  if #args == 0 then
    return { }
  end
  if type(args[1]) ~= "table" then
    return { }
  end
  if #args <= 1 then
    return args[1]
  end
  return aux(args[1], (tail(args)))
end
return M
