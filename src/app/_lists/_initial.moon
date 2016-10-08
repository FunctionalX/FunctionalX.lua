M = {}
-- return a list with all but the last item
M.init = (list) ->
    return {} if (type list) != "table"
    return {} if #list <= 1
    return [list[i] for i = 1, #list-1 ]
return M