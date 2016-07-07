-- "..." will be provided by require() function
local parent_module_name = ... 
local module_functions = {
    "_next",
    "_head",
    "_tail",
    "_append",
}
local TK = require("PackageToolkit")
local  M = TK.subfunctions(parent_module_name, module_functions)
return M