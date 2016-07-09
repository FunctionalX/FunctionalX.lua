parent = "core_FunctionalX"
TK = require("PackageToolkit")
submodule_names = {
    "_lists",
    "_strings",
    "_directory",
}
M = TK.submodules parent, submodule_names
return M