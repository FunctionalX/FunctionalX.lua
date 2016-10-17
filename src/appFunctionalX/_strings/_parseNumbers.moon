M = {}
T = (require "PackageToolkit").module
split = (T.import ..., "..", "..", "_strings", "_split").split
join  = (T.import ..., "..", "..", "_strings", "_join").join
tail  = (T.import ..., "..", "..", "_lists", "_tail").tail
append  = (T.import ..., "..", "..", "_lists", "_append").append


-- Return two lists L1 and L2
-- L1 is the list of integers before the first ","
-- L2 is a list one string which represent the rest of the input
-- Examples:
-- parse(",") => {}, {}
-- parse(",", "1") => {1}, {}
-- parse(",", "1,2") => {1}, {"2"}
-- parse(",", "1,2,3") => {1}, {"2,3"}
-- parse(",", "1 2,1") => {1,2}, {"1"}
M.parseNumbers = (sep, ...) ->
    -- expect ... to be a list of a single string, e.g. '1 2,1'
    to_numbers = (xs) -> [tonumber(i) for i in *xs]

    if #{...} == 0
        return {}, {}
    else
        args = {...}
        arg_str = args[1]
        arg_groups = split arg_str, sep
        if #arg_groups > 1
            return (to_numbers (split arg_groups[1])), {join(sep, unpack(tail(arg_groups)))}
        else
            return (to_numbers (split arg_groups[1])), {}
return M