local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local head = TK.module.require(root_parent .. "._lists._head", "head")
M.join = function(...)
  local args = {
    ...
  }
  local separator = head(args)
  local list = tail(args)
  local aux
  aux = function(list, accum)
    if #list == 0 then
      return accum
    else
      return aux((tail(list)), accum .. separator .. (tostring(head(list))))
    end
  end
  if #list == 0 then
    return ""
  end
  return aux((tail(list)), (tostring(head(list))))
end
return M
