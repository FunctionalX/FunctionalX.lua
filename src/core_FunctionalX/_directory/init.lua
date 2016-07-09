local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_path"
}
return TK.module.subfunctions(parent, members)
