local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local get_keys = TK.module.require(root_parent .. "._table._keys", "keys")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local head = TK.module.require(root_parent .. "._lists._head", "head")
local append = TK.module.require(root_parent .. "._lists._append", "append")
M.str = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local format_key
  format_key = function(k)
    if string.match(k, "%s") then
      return string.format("[\"%s\"]", k)
    else
      return k
    end
  end
  local aux
  aux = function(dict, keys, accum, prefix)
    if #keys == 0 then
      local sep = string.format(",\n%s%s", prefix, indent)
      return add_brackets((table.concat(accum, sep)), prefix)
    else
      local k = head(keys)
      local v = ""
      if type(dict[k]) == "table" then
        v = aux(dict[k], (get_keys(dict[k])), { }, indent)
      else
        v = tostring(dict[k])
      end
      local new_item = string.format("%s = %s", (format_key(k)), v)
      return aux(dict, (tail(keys)), (append(accum, new_item)), prefix)
    end
  end
  return aux(t, (get_keys(t)), { }, "")
end
return M
