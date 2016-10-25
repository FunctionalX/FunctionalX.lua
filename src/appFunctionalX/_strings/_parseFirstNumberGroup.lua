local M = { }
local T = (require("PackageToolkit")).module
local split = (T.import(..., "_split")).split
local join = (T.import(..., "_join")).join
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
M.parseFirstNumberGroup = function(arg_str, sep1, sep2)
  if arg_str == nil then
    arg_str = ""
  end
  if sep1 == nil then
    sep1 = ","
  end
  if sep2 == nil then
    sep2 = "%s"
  end
  local to_numbers
  to_numbers = function(xs)
    local _accum_0 = { }
    local _len_0 = 1
    for _index_0 = 1, #xs do
      local i = xs[_index_0]
      _accum_0[_len_0] = tonumber(i)
      _len_0 = _len_0 + 1
    end
    return _accum_0
  end
  if arg_str == "" then
    return { }, ""
  else
    local arg_groups = split(arg_str, sep1)
    if #arg_groups > 1 then
      return (to_numbers((split(arg_groups[1], sep2)))), join(sep1, unpack(tail(arg_groups)))
    else
      return (to_numbers((split(arg_groups[1], sep2)))), ""
    end
  end
end
return M
