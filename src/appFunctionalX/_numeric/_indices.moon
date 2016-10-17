M = {}
-- If only one input is given, returns the range between 1 and n
-- If more than one input are given, return the list of numbers starting from
-- the 2nd argument
-- indices(3) return {1,2,3}
-- indices(3, 1,2) returns {1,2}
M.indices = (n, ...) ->
    args = {...}
    if #args == 0
        return [i for i = 1, n]
    else
        return args
return M