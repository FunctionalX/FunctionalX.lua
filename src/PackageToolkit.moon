M = {}

-- split a string
M.split = (str, symbol="%s") -> [x for x in string.gmatch(str, "([^"..symbol.."]+)")]

-- return the prefix of a module
M.module_prefix = (full_module_name) -> (select '1', (string.match full_module_name, ".+%.")) or ""

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


-- return the full module name with qualifier prefix
M.full_module_name = (parent, name) -> string.format("%s.%s", parent, name)

M.submodules = (parent_name, name_list) ->
    return {} if (type name_list) != 'table'
    aux = (name_list, accum) ->
        if #name_list == 0
            return accum
        else
            bare_name = name_list[1]
            full_name = M.full_module_name parent_name, bare_name
            m = (require full_name)
            if m == nil
                print "ERROR: cannot import module "..full_name
            else
                return aux (M.tail name_list), (M.merge accum, {[bare_name]: m})
    
    return aux name_list, {}

M.subfunctions = (parent_name, name_list) ->
    return {} if (type name_list) != 'table'
    aux = (name_list, accum) ->
        if #name_list == 0
            return accum
        else
            bare_name = name_list[1]
            full_name = M.full_module_name parent_name, bare_name
            m = (require full_name)
            if m == nil
                print "ERROR: cannot import module "..full_name
            else
                return aux (M.tail name_list), (M.merge accum, {[bare_name]: m[bare_name]})
                            
    return aux name_list, {}

M.test_module = (target_module) ->
    for name, test in pairs(target_module)
        result = test[name]()
        return false if result == false
    return true


-- return the function inside a module with the same name
M.require_function = (module_name) -> require(module_name)[module_name]

M.dashed_line = (n, symbol="-") ->
    aux = (n, symbol, accum) ->
        if n == 0
            return accum
        else
            return aux (n-1), symbol, accum..symbol
    return aux n, symbol, ""

return M