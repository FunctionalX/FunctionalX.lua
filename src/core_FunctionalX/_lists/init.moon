-- "..." will be provided by require() function
parent_module_name = ... 
module_functions = {
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
TK = require("PackageToolkit")
return TK.module.subfunctions parent_module_name, module_functions
