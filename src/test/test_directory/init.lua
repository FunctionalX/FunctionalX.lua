local name = "test_directory"
local tests = {
  "test_path"
}
local parent = ...
local TK = require("PackageToolkit")
local T = TK.submodules(parent, tests)
local M = { }
M[name] = function()
  return TK.test_module(T)
end
return M
