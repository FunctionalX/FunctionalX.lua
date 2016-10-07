local M = { }
M.range = function(start, stop, step)
  if step == nil then
    step = 1
  end
  local output = { }
  for i = start, stop, step do
    output[#output + 1] = i
  end
  return output
end
return M
