local M = { }
M.split = function(str, sep)
  if str == nil then
    str = ""
  end
  if sep == nil then
    sep = " \t"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. sep .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M
