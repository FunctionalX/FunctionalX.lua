local M = { }
local T = require("PackageToolkit").module
local windows = T.import(..., "_windows").windows
M.path = function(env)
  if windows() then
    if env == "HOME" then
      return string.format("C:%s", os.getenv("HOMEPATH"))
    else
      return ""
    end
  else
    if env == "HOME" then
      return os.getenv("HOME")
    else
      return ""
    end
  end
end
return M
