TK = require("PackageToolkit")
parent = ... 
members = {
    "_append",
    "_cart2",
    "_concat2",
    "_concat",
    "_head",
    "_initial",
    "_merge",
    "_next",
    "_prepend",
    "_tail",
    "_take",
    "_drop",
}
return TK.module.subfunctions parent, members
