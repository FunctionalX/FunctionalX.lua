M = {}
T = require("PackageToolkit").module
split  = (T.import ..., "_split").split
range  = (T.import ..., "../_numeric/_range").range

-- parse a string and return numbers
-- parseNumber() => {}
-- parseNumber("") => {}
-- parseNumber("1") => {1}
-- parseNumber("1,2", ",") => {1,2}
-- parseNumber("1 2 3") => {1,2,3}
-- parseNumber("1 2 3", "%s") => {1,2,3}
M.parseNumbers = (arg_str="", sep="%s") ->
    to_numbers = (xs) -> [tonumber(i) for i in *xs]
    return (to_numbers (split arg_str, sep))
return M

