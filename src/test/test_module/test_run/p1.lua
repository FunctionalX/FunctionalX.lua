local M = { }
M.main = function(...)
  local output = { }
  local _list_0 = {
    ...
  }
  for _index_0 = 1, #_list_0 do
    local i = _list_0[_index_0]
    output[#output + 1] = string.format("hello %d", i)
  end
  return unpack(output)
end
return M
