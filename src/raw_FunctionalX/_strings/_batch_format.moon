M = {}
parent = ...
TK = require("PackageToolkit")
root_parent = TK.module_root parent
L = require root_parent..".".."_lists"

-- return a list of strings for a given template using a variable list
M.batch_format = (format_template, variable_list) -> 
    aux = (format_template, variable_list, accum) -> 
        if #variable_list == 0
            return accum
        else
            item = string.format format_template, variable_list[1]
            return aux format_template, (L.tail variable_list), (L.append accum, item)
    return aux format_template, variable_list, {}
return M