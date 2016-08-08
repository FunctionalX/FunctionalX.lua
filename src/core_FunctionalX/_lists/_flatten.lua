local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local head = TK.module.require(root_parent .. "._lists._head", "head")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local append = TK.module.require(root_parent .. "._lists._append", "append")
M.flatten = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(lists, accum)
    if #lists == 0 then
      return accum
    elseif (type(lists[1])) == "table" then
      return aux((tail(lists)), (aux(lists[1], accum)))
    else
      return aux((tail(lists)), (append(accum, lists[1])))
    end
  end
  return aux(args, { })
end
return M
