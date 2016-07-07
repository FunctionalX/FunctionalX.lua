M = {}
-- return a list of strings for a given template using a variable list
M.batch_format = (format_template, variable_list) -> 
    aux = (format_template, variable_list, accum) -> 
        if #variable_list == 0
            return accum
        else
            item = string.format format_template, variable_list[1]
            return aux format_template, (M.tail variable_list), (M.append accum, item)
    return aux format_template, variable_list, {}
return M