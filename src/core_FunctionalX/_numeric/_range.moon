-- Return a integer sequence between start and stop
-- and steps size (equivalent to python's range())
M = {}
M.range = (start, stop, step=1) ->
    output = {}
    for i = start, stop, step
        output[#output+1] = i
    return output
return M