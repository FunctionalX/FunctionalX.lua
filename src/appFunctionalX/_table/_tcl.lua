local M = { }
local T = require("PackageToolkit").module
local head = (T.import(..., "../_lists/_head")).head
local tail = (T.import(..., "../_lists/_tail")).tail
local trim = (T.import(..., "../_strings/_trim")).trim
local append = (T.import(..., "../_lists/_append")).append
local get_keys = (T.import(..., "_keys")).keys
local add_brackets = (T.import(..., "_tcl_add_brackets")).add_brackets
M.tcl = function(t, pretty, expand, indent)
  if pretty == nil then
    pretty = false
  end
  if expand == nil then
    expand = false
  end
  if indent == nil then
    indent = "  "
  end
  local quote
  quote = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      if expand == true then
        return string.format("[ join [ list %s ] ]", obj)
      else
        return string.format("{%s}", (trim(obj, "%s")))
      end
    else
      return tostring(obj)
    end
  end
  local format_item
  format_item = function(k, v)
    if type(k) == "number" then
      return string.format("%s", v)
    else
      return string.format("%s %s", (quote(k)), v)
    end
  end
  local aux
  aux = function(dict, keys, accum, prefix)
    if #keys == 0 then
      if pretty == true then
        local sep = string.format("\n%s%s", prefix, indent)
        return add_brackets((table.concat(accum, sep)), prefix, indent, true, expand)
      else
        return add_brackets((table.concat(accum, " ")), "", "", false, expand)
      end
    else
      local k = head(keys)
      local v = ""
      if type(dict[k]) == "table" then
        v = aux(dict[k], (get_keys(dict[k])), { }, indent)
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
