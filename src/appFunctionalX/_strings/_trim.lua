local M = { }
M.trim = function(str, chars)
  if chars == nil then
    chars = "%s"
  end
  local pattern = string.format("^%s*(.-)%s*$", chars, chars)
  return string.match(str, pattern)
end
return M
