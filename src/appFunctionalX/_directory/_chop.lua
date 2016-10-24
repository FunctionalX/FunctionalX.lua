local M = { }
local TK = require("PackageToolkit")
local pathsep = (TK.module.import(..., "../_os/_pathsep")).pathsep
M.chop = function(path)
  if (string.match(path, "[/\\%.]")) == nil then
    return ""
  else
    local result, _ = string.gsub((string.match(path, "(.-)[/\\%.]?[^%./\\]+$")), "%.", pathsep())
    return result
  end
end
return M
