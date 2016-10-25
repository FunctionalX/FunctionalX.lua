M = {}
-- Split a string
M.split = (str="", sep="%s") -> [x for x in string.gmatch(str, "([^"..sep.."]+)")]
return M

