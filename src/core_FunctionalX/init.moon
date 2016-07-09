parent = "core_FunctionalX"
TK = require("PackageToolkit")
submodule_names = {
    "_lists",
    "_strings",
    "_directory",
}
M = TK.module.submodules parent, submodule_names
return M