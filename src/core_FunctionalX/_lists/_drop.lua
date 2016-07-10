local M = { }
local me = ...
local TK = require("PackageToolkit")
local root_parent = TK.module.root(me)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
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
