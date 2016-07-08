-- "..." will be provided by require() function
local parent_module_name = ... 
local module_functions = {
    "_cart2",
    "_cartn",
    "_split",
    "_batch_format",
}
local TK = require("PackageToolkit")
local  M = TK.subfunctions(parent_module_name, module_functions)
return M