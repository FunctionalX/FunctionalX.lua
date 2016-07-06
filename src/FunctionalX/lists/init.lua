-- "..." will be provided by require() function
local parent_module_name = ... 
print("parent_module_name ", parent_module_name)
local module_functions = {
    "next",
    -- "head",
    -- "tail",
    -- "initial",
}
local TK = require("PackageToolkit")
local  M = TK.subfunctions(parent_module_name, module_functions)
print(M.next)
return M