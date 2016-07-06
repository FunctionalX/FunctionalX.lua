M = {}

-- return the tail of a list
M.tail = (list, start_index=1) ->
    return {} if (type list) != "table"
    return {} if #list <= 1
    return [list[i] for i = (start_index+1), #list]

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

M.submodules = (parent_name, name_list) ->
    return {} if (type name_list) != 'table'
    aux = (name_list, accum) ->
        if #name_list == 0
            return accum
        else
            name = string.format "%s.%s", parent_name, name_list[1]
            print "module name: ", name
            m = (require name)
            if m == nil
                print "ERROR: cannot import module "..name
            else
                return aux (M.tail name_list), (M.merge accum, {[name]: m})
    
    return aux name_list, {}

M.subfunctions = (target_module, parent_name, name_list) ->
    return {} if (type name_list) != 'table'
    aux = (name_list, accum) ->
        if #name_list == 0
            return accum
        else
            name = string.format "%s.%s", parent_name, name_list[1]
            m = (require name)
            print "name: ", name
            if m == nil
                print "ERROR: cannot import module "..name
            else
                return aux (M.tail name_list), (M.merge accum, {[name]: m[name]})
                            
    return aux name_list, {}

M.test_all = (test_module) ->
    for k, f in pairs(test_module)
        f()


M.dashed_line = (n, symbol="-") ->
    aux = (n, symbol, accum) ->
        if n == 0
            return accum
        else
            return aux (n-1), symbol, accum..symbol
    return aux n, symbol, ""

return M