M = {}
T = require("PackageToolkit").module
windows = T.import(..., "_windows").windows
M.path = (env) ->
    if windows()
        if env == "HOME"
            return os.getenv "HOMEPATH"
        else
            return ""
    else
        if env == "HOME"
            return os.getenv "HOME"
        else 
            return ""
return M
