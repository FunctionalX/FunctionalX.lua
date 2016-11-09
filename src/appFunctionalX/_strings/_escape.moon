M = {}
T = require("PackageToolkit").module
tail  = (T.import ..., "../_lists/_tail").tail

M.escape = (str, chars={}) ->
    if #chars == 0
        return str
    else
        pattern = string.format "[%s]", chars[1]
        replacement = string.format "\\%s", chars[1]
        return M.escape (string.gsub str, pattern, replacement), (tail chars)
return M
