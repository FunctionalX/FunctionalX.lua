M = {}
-- Enclose a string with Tcl style brackets
M.add_brackets = (s, prefix, indent, pretty=false, expand=false) ->
    if pretty == false
        if expand == false
            return string.format "{ %s }", s
        else
            return string.format "[ list %s ]", s
    else
        if expand == false 
            return string.format "{\n%s%s%s\n%s}", prefix, indent, s, prefix
        else
            return string.format "[ list \n%s%s%s\n%s ]", prefix, indent, s, prefix
return M