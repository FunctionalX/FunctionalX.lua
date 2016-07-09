-- "..." will be provided by require() function
local parent_module_name = ... 
local module_functions = {
    "_path"
}
local TK = require("PackageToolkit")
local  M = TK.module.subfunctions(parent_module_name, module_functions)
return M