local M = { }
local T = require("PackageToolkit").module
local split = (T.import(..., "_split")).split
local range = (T.import(..., "../_numeric/_range")).range
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
local concat = (T.import(..., "../_lists/_concat")).concat
M.parseNumbers = function(arg_str, sep)
  if arg_str == nil then
    arg_str = ""
  end
  if sep == nil then
    sep = "%s"
  end
  local to_numbers
  to_numbers = function(xs, accum)
    if #xs == 0 then
      return accum
    else
      if string.match(xs[1], "^%d+$") ~= nil then
        return to_numbers((tail(xs)), (append(accum, (tonumber(xs[1])))))
      elseif string.match(xs[1], "^%d+-%d+$") ~= nil then
        local a, b = string.match(xs[1], "^(%d+)-(%d+)$")
        return to_numbers((tail(xs)), (concat(accum, (range(tonumber(a), tonumber(b))))))
      else
        return to_numbers((tail(xs)), accum)
      end
    end
  end
  return (to_numbers((split(arg_str, sep)), { }))
end
return M
