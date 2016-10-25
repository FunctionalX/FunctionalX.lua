local M = { }
local T = require("PackageToolkit").module
local split = (T.import(..., "_split")).split
local range = (T.import(..., "../_numeric/_range")).range
M.parseNumbers = function(arg_str, sep)
  if arg_str == nil then
    arg_str = ""
  end
  if sep == nil then
    sep = " "
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
  return (to_numbers((split(arg_str, sep))))
end
return M
