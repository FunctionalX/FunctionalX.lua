local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_range",
  "_indices"
}
return TK.module.subfunctions(parent, members)
