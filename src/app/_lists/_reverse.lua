local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
local prepend = TK.module.require(root_parent .. "._lists._prepend", "prepend")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.reverse = function(list)
  local aux
  aux = function(list, accum)
    if #list == 0 then
      return accum
    else
      return aux((tail(list)), (prepend(list[1], accum)))
    end
  end
  return aux(list, { })
end
return M
