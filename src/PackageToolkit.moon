M = {}

-- split a string
M.split = (str, symbol="%s") -> [x for x in string.gmatch(str, "([^"..symbol.."]+)")]

-- return the prefix of a module
M.module_prefix = (full_module_name) -> (string.gsub (string.match full_module_name, ".+%."), ".$", "") or ""
M.module_root = (full_module_name) -> (M.split full_module_name, ".")[1] or ""

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

M.remove_prefix = (str, symbol) -> string.gsub(str, "^_+", "")

M.submodules = (parent_name, name_list) ->
    return {} if (type name_list) != 'table'
    aux = (name_list, accum) ->
        if #name_list == 0
            return accum
        else
            raw_name = name_list[1]
            bare_name = M.remove_prefix raw_name, "_"
            full_name = M.full_module_name parent_name, raw_name
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
            raw_name = name_list[1]
            bare_name = M.remove_prefix raw_name, "_"
            full_name = M.full_module_name parent_name, raw_name
            m = (require full_name)
            if m == nil
                print "ERROR: cannot import module "..full_name
            else
                return aux (M.tail name_list), (M.merge accum, {[bare_name]: m[bare_name]})
                            
    return aux name_list, {}

-- extract a member from a module
M.module_member = (full_module_name, member_name) -> (require full_module_name)[member_name]

M.test_module = (target_module) ->
    for name, test in pairs(target_module)
        print string.format "ERROR HINT: %s() doesn't exist", name if test[name]== nil
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

M.equal_lists = (list1, list2) ->
    return false if (type list1) != "table"
    return false if (type list2) != "table"
    condition1 = #list1 == 0
    condition2 = #list2 == 0
    return false if condition1 and not condition2
    return false if condition2 and not condition1
    return true  if condition1 and condition2
    if list1[1] == list2[1]
        return M.equal_lists (M.tail list1), (M.tail list2)
    else
        return false

return M