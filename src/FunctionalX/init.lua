local parent = "FunctionalX"
local TK = require("PackageToolkit")
local submodule_names = {
    "lists",
    -- "strings",
}
local  M = TK.submodules(parent, submodule_names)
return M