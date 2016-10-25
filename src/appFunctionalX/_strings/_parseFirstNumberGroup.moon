M = {}
T = (require "PackageToolkit").module
split = (T.import ..., "_split").split
join  = (T.import ..., "_join").join
tail  = (T.import ..., "../_lists/_tail").tail
append  = (T.import ..., "../_lists/_append").append

-- Return two lists L1 and L2
-- L1 is the list of integers before the level-1 separator (default: ",")
-- which are separated by level-2 separator (default: white spaces "%s")
-- L2 is a string which represent the rest of the input
-- Examples:
-- parseFirstNumber() => {}, ""
-- parseFirstNumber("") => {}, ""
-- parseFirstNumber("1") => {1}, ""
-- parseFirstNumber("1,2", ",") => {1}, "2"
-- parseFirstNumber("1,2,3", ",") => {1}, "2,3"
-- parseFirstNumber("1 2,1", ",") => {1,2}, "1"
M.parseFirstNumberGroup = (arg_str="", sep1=",", sep2="%s") ->
    -- expect ... to be a list of a single string, e.g. '1 2,1'
    to_numbers = (xs) -> [tonumber(i) for i in *xs]

    if arg_str == ""
        return {}, ""
    else
        arg_groups = split arg_str, sep1
        if #arg_groups > 1
            return (to_numbers (split arg_groups[1], sep2)), join(sep1, unpack(tail(arg_groups)))
        else
            return (to_numbers (split arg_groups[1], sep2)), ""
return M