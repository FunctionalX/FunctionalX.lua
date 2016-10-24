local M = { }
local TK = require("PackageToolkit")
local os_path = (TK.module.import(..., "../_os/_path")).path
local path = (require((string.format("%s.%s", os_path("HOME"), "umolflow")))).path
M.fpath = function(module_name)
  if module_name == nil then
    return path("fn")
  else
    return string.format("%s.%s", path("fn"), module_name)
  end
end
return M
