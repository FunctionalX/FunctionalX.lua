-- "..." will be provided by require() function
local parent_module_name = ... 
local module_functions = {
    "_append",
    "_cart2",
    "_concat",
    "_concatn",
    "_head",
    "_initial",
    "_merge",
    "_next",
    "_prepend",
    "_tail",
}
local TK = require("PackageToolkit")
local  M = TK.subfunctions(parent_module_name, module_functions)
return M