local TK = require("PackageToolkit")
local parent = "appFunctionalX"
local members = {
  "_lists",
  "_strings",
  "_directory",
  "_fn",
  "_table",
  "_numeric",
  "_os",
  "_tk"
}
return TK.module.submodules(parent, members)
