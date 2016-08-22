local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
local append = TK.module.require(root_parent .. "._lists._append", "append")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.replicate = function(n, item)
  local aux
  aux = function(n, item, accum)
    if n <= 0 then
      return accum
    else
      return aux((n - 1), item, (append(accum, item)))
    end
  end
  return aux(n, item, { })
end
return M
