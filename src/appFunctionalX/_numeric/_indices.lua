local M = { }
local T = require("PackageToolkit").module
local parseNumbers = (T.import(..., "../_strings/_parseNumbers")).parseNumbers
M.indices = function(n, ...)
  if n == nil then
    n = 1
  end
  local args = {
    ...
  }
  if #args == 0 then
    local _accum_0 = { }
    local _len_0 = 1
    for i = 1, n do
      _accum_0[_len_0] = i
      _len_0 = _len_0 + 1
    end
    return _accum_0
  else
    if type(args[1]) == "number" then
      return args
    elseif type(args[1]) == "string" then
      return parseNumbers(args[1], " ")
    else
      print("WARNING: unrecognized second argument to FX.numeric.indices(): " .. tostring(args[1]))
      return { }
    end
  end
end
return M
