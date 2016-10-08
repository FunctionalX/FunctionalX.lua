local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_append",
  "_cart2",
  "_cart",
  "_concat2",
  "_concat",
  "_head",
  "_initial",
  "_merge2",
  "_merge",
  "_next",
  "_prepend",
  "_tail",
  "_take",
  "_drop",
  "_flatten",
  "_reverse",
  "_replicate"
}
return TK.module.subfunctions(parent, members)
