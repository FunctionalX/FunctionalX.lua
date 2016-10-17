local M = { }
M.indices = function(n, ...)
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
    return args
  end
end
return M
