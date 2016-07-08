M = {}
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
return M