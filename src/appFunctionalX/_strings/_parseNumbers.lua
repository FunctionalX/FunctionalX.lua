local M = { }
local T = (require("PackageToolkit")).module
local split = (T.import(..., "_split")).split
local join = (T.import(..., "_join")).join
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
M.parseNumbers = function(sep, ...)
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
  if #{
    ...
  } == 0 then
    return { }, { }
  else
    local args = {
      ...
    }
    local arg_str = args[1]
    local arg_groups = split(arg_str, sep)
    if #arg_groups > 1 then
      return (to_numbers((split(arg_groups[1])))), {
        join(sep, unpack(tail(arg_groups)))
      }
    else
      return (to_numbers((split(arg_groups[1])))), { }
    end
  end
end
return M
