M = {}
-- trim the leading and trailing characters (default: white spaces)
M.trim = (str, chars="%s") ->
    pattern = string.format "^%s*(.-)%s*$", chars, chars
    return string.match(str, pattern)
return M