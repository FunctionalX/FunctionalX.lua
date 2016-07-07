M = {}
-- return the tail of a list
M.tail = (list, start_index=1) ->
    return {} if (type list) != "table"
    return {} if #list <= 1
    return [list[i] for i = (start_index+1), #list]
return M