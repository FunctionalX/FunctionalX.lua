local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_windows",
  "_path",
  "_pathsep"
}
return TK.module.subfunctions(parent, members)
