local M = {}
local TM = "FunctionalX"
local TK = require("PackageToolkit")

local submodule_names = {
    "lists",
}

TK.submodules(M, "FunctionalX", submodule_names)

return M