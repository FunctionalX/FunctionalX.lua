M = {}
TK = require "PackageToolkit"
os_path = (TK.module.import ..., "../_os/_path").path
path = (require (string.format "%s.%s", os_path("HOME"), "umolflow")).path
M.fpath = (module_name) ->
    if module_name == nil 
        return path "fn"
    else
        return string.format "%s.%s", path("fn"), module_name
return M