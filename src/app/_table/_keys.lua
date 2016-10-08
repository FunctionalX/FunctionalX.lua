local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local concat = TK.module.require(root_parent .. "._lists._concat", "concat")
M.keys = function(t)
  local strs = { }
  local numbers = { }
  local others = { }
  for k, v in pairs(t) do
    if type(k) == "number" then
      numbers[#numbers + 1] = k
    elseif type(k) == "string" then
      strs[#strs + 1] = k
    else
      others[#others + 1] = k
    end
  end
  table.sort(strs)
  return concat(numbers, strs, others)
end
return M
