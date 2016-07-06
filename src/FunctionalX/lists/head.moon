M = {}
-- return the first item of a list
M.head = (list) ->
    return nil if (type list) != "table"
    return nil if #list == 0
    return list[1]
return M