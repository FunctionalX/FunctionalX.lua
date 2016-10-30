local M = { }
local T = require("PackageToolkit").module
local head = (T.import(..., "../_lists/_head")).head
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
local get_keys = (T.import(..., "_keys")).keys
M.str = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local bracket
  bracket = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("[%s]", obj)
    else
      return tostring(obj)
    end
  end
  local quote
  quote = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("\"%s\"", obj)
    else
      return tostring(obj)
    end
  end
  local format_item
  format_item = function(k, v)
    if type(k) == "number" then
      return string.format("%s", v)
    else
      return string.format("%s = %s", (bracket((quote(k)))), v)
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
        v = aux(dict[k], (get_keys(dict[k])), { }, prefix .. indent)
      else
        v = quote(dict[k])
      end
      local new_item = format_item(k, v)
      return aux(dict, (tail(keys)), (append(accum, new_item)), prefix)
    end
  end
  return aux(t, (get_keys(t)), { }, "")
end
return M
