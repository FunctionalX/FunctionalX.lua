local TK = require("PackageToolkit")
local M = { }
local me = ...
local root = TK.module.root(me)
local head = TK.module.require(root .. "._lists._head", "head")
local tail = TK.module.require(root .. "._lists._tail", "tail")
local append = TK.module.require(root .. "._lists._append", "append")
M.map = function(f, list)
  local aux
  aux = function(f, list, accum)
    if #list == 0 then
      return accum
    else
      return aux(f, (tail(list)), (append(accum, (f((head(list)))))))
    end
  end
  if (type(list)) ~= "table" then
    return { }
  end
  return aux(f, list, { })
end
return M
