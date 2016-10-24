local M = { }
local TK = require("PackageToolkit")
local fpath = (TK.module.import(..., "_fpath")).fpath
M.fimport = function(module_name)
  if module_name == nil then
    print("ERROR HINT: must give at least one input. usage example: fimport(\"module1\")")
    return nil
  else
    return require(fpath(module_name))
  end
end
return M
