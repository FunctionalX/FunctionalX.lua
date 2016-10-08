TK = require("PackageToolkit")
parent = "appFunctionalX"
members = {
    "_lists"
    "_strings"
    "_directory"
    "_fn",
    "_table"
    "_numeric"
    "_os"
}
return TK.module.submodules parent, members
