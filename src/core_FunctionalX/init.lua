local TK = require("PackageToolkit")
local parent = "core_FunctionalX"
local members = {
  "_lists",
  "_strings",
  "_directory",
  "_fn",
  "_table",
  "_numeric"
}
return TK.module.submodules(parent, members)
