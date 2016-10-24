local M = { }
local name = "test_path"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = FX.os.path
  print(fn("HOME"))
  print("---------------------")
  print("path separator: " .. FX.os.pathsep())
  print("---------------------")
  return true
end
return M
