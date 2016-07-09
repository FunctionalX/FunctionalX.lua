-- "..." will be provided by require() function
parent_module_name = ... 
module_functions = {
    "_cart2",
    "_cartn",
    "_split",
    "_batch_format",
}
TK = require "PackageToolkit"
M = TK.module.subfunctions parent_module_name, module_functions
return M