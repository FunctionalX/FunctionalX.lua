-- Return all the (sorted) keys of a table
M = {}
M.keys = (t) ->
    output = {}
    for k, v in pairs(t) 
        output[#output+1] = k
    table.sort(output)
    return output
return M