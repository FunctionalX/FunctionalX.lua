local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local concat = TK.module.require(root_parent .. "._lists._concat", "concat")
M.concatn = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(input, accum)
    if #input == 0 then
      return accum
    end
    return aux((tail(input)), (concat(accum, input[1])))
  end
  return aux(args, { })
end
return M
