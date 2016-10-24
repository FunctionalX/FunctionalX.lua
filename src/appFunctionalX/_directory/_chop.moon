M = {}
TK = require "PackageToolkit"
pathsep = (TK.import ..., "../_os/_pathsep").pathsep

-- chop off the last part of a directory path
-- and return a standard version of the directory path
-- separated by the OS path separator
M.chop = (path) -> 
        if (string.match path, "[/\\%.]") == nil 
            -- if both caller and callee modules live at the root directory
            return ""
        else 
            -- example "a.b/c.d" => "a.b/c"
            return string.gsub (string.match path, "(.-)[/\\%.]?[^%./\\]+$"), ".", pathsep()
return M
    