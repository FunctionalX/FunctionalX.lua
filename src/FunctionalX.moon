M = {}

-- return the next item in a list
M.next = (list) ->
    return nil if (type list) != "table"
    if #list >= 2
        return list[2]
    else
        return nil
        
-- return the first item of a list
M.head = (list) ->
    return nil if (type list) != "table"
    return nil if #list == 0
    return list[1]

-- return the tail of a list
M.tail = (list, start_index=1) ->
    return {} if (type list) != "table"
    return {} if #list <= 1
    return [list[i] for i = (start_index+1), #list]

-- return a list with all but the last item
M.init = (list) ->
    return {} if (type list) != "table"
    return {} if #list <= 1
    return [list[i] for i = 1, #list-1 ]

-- concatenate two lists
M.concat = (list1, list2) ->
    ondition1 = (type list1) == "table"
    condition2 = (type list2) == "table"
    return {} if (not condition1) and (not condition2)
    return list1 if not condition2
    return list2 if not condition1
    output = [list1[i] for i = 1, #list1]
    for item in *list2
        output[#output+1] = item
    return output

-- merge two hash tables (nil values will be removed)
M.merge = (table1, table2) ->
    condition1 = (type table1) == "table"
    condition2 = (type table2) == "table"
    return {} if (not condition1) and (not condition2)
    return table1 if not condition2
    return table2 if not condition1
    output = {}
    for k, v in pairs table1
        output[k] = v if v != nil 
    for k, v in pairs table2
        output[k] = v if v != nil
    return output

-- append an item a list
M.append = (list, item) ->
    return {item} if (type list) != "table" and item != nil
    return table  if (type list) == "table" and item == nil
    return {}     if (type list) != "table" and item == nil
    output = [x for x in *list]
    output[#output+1] = item
    return output

-- prepend  an item to a list
M.prepend = (item, list) ->
    return {} if (type list) != "table"
    return list if item == nil
    output = {item}
    for x in *list
        output[#output+1] = x
    return output

-- return a list of strings for a given template using a variable list
M.formated_strings = (format_template, variable_list) -> 
    aux = (format_template, variable_list, accum) -> 
        if #variable_list == 0
            return accum
        else
            item = string.format format_template, variable_list[1]
            return aux format_template, (M.tail variable_list), (M.append accum, item)
    return aux format_template, variable_list, {}

-- take a the Cartesian product of two lists
M.string_cart2 = (list1, list2) -> 
    aux = (list1, list2, accum) ->
        if #list2 == 0 or #list1 == 0 
            return accum
        elseif #list1 == 1
            return aux list1, (M.tail list2), (M.append accum, list1[1]..list2[1])
        else
            return aux (M.tail list1), list2, (aux { list1[1] }, list2, accum)
    return {} if type(list1) != "table"
    return {} if type(list2) != "table"
    return aux list1, list2, {}

-- take a the Cartesian product for more than two lists
-- The input is a list of lists
M.string_cartn = (...) ->
    aux = (list1, other_lists) ->
        if #other_lists == 0
            return list1
        else
            return aux list1, {} if type(other_lists[1]) != "table"
            return aux (M.string_cart2 list1, other_lists[1]), (M.tail other_lists)
    args = {...}
    return {} if type(args) != "table"
    return {} if #args == 0
    return {} if type(args[1]) != "table"
    return args[1] if #args <= 1
    return aux args[1], (M.tail args)

-- Split a string
M.string_split = (str, symbol="%s") -> [x for x in string.gmatch(str, "([^"..symbol.."]+)")]

-- return a path string given the subdirectories
M.dir_path = (...) ->
    dir_separator = M.head M.string_split package.config
    aux = (subdirs, accum) ->
        if #subdirs == 0
            return accum
        else
            return aux (M.tail subdirs), accum..dir_separator..tostring(subdirs[1])
    args = {...}
    return "" if #args == 0
    return args[1] if #args == 1
    return aux (M.tail args), (tostring args[1])

return M
