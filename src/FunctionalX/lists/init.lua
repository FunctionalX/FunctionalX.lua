local M = {}
-- "..." will be provided by require() function
local parent_module_name = ... 
local module_functions = {
    "next",
    "head",
}
local TK = require("PackageToolkit")

TK.subfunctions(M, parent_module_name, module_functions)

return M