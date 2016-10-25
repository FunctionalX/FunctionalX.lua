M = {}
-- Split a string
M.split = (str="", sep=" \t") -> [x for x in string.gmatch(str, "([^"..sep.."]+)")]
return M

