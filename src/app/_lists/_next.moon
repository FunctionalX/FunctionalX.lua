M = {}
-- return the next item in a list
M.next = (list) ->
    return nil if (type list) != "table"
    if #list >= 2
        return list[2]
    else
        return nil
return M
