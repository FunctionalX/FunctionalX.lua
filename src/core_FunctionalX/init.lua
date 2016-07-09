local parent = "core_FunctionalX"
local TK = require("PackageToolkit")
local submodule_names = {
  "_lists",
  "_strings",
  "_directory"
}
local M = TK.submodules(parent, submodule_names)
return M
