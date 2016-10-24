M = {}
TK = require "PackageToolkit"
fpath = (TK.module.import ..., "_fpath").fpath

M.fimport = (module_name) ->
    if module_name == nil 
        print "ERROR HINT: must give at least one input. usage example: fimport(\"module1\")"
        return nil
    else
        return require fpath(module_name)
return M