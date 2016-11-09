local M = { }
local T = require("PackageToolkit").module
local tail = (T.import(..., "../_lists/_tail")).tail
M.escape = function(str, chars)
  if #chars == 0 then
    return str
  else
    local pattern = string.format("[%s]", chars[1])
    local replacement = string.format("\\%s", chars[1])
    return M.escape((string.gsub(str, pattern, replacement)), (tail(chars)))
  end
end
return M
