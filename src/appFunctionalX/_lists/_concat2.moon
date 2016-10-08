M = {}
-- concatenate two lists
M.concat2 = (list1, list2) ->
    condition1 = (type list1) == "table"
    condition2 = (type list2) == "table"
    return {} if (not condition1) and (not condition2)
    return list1 if not condition2
    return list2 if not condition1
    output = [list1[i] for i = 1, #list1]
    for item in *list2
        output[#output+1] = item
    return output
return M