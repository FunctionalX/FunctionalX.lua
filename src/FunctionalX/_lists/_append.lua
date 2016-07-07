local M = { }
M.append = function(list, item)
  if (type(list)) ~= "table" and item ~= nil then
    return {
      item
    }
  end
  if (type(list)) == "table" and item == nil then
    return table
  end
  if (type(list)) ~= "table" and item == nil then
    return { }
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for _index_0 = 1, #list do
      local x = list[_index_0]
      _accum_0[_len_0] = x
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  output[#output + 1] = item
  return output
end
return M
