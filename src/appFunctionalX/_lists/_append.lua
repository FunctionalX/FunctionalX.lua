local M = { }
local TK = require("PackageToolkit")
local tail = (TK.module.import(..., '..', '_tail')).tail
M.append = function(list, ...)
  local items = {
    ...
  }
  if #items == 0 then
    return list
  end
  if (type(list)) ~= "table" and #items ~= 0 then
    return items
  end
  if (type(list)) == "table" and #items == 0 then
    return table
  end
  if (type(list)) ~= "table" and #items == 0 then
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
  for _index_0 = 1, #items do
    local item = items[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M
