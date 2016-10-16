-- Return all the (sorted) keys of a table
M = {}
T = require("PackageToolkit").module
concat  = (T.import ..., "..", "..", "_lists", "_concat").concat

M.keys = (t) ->
    strs = {}
    numbers = {}
    others = {}
    for k, v in pairs(t) 
        if type(k) == "number"
            numbers[#numbers+1] = k
        elseif type(k) == "string"
            strs[#strs+1] = k 
        else
            others[#others+1] = k
    table.sort(strs)
    return concat numbers, strs, others
return M