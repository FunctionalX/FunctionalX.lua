M = {}
T = require("PackageToolkit").module
split  = (T.import ..., "_split").split
range  = (T.import ..., "../_numeric/_range").range
tail = (T.import ..., "../_lists/_tail").tail
append = (T.import ..., "../_lists/_append").append
concat = (T.import ..., "../_lists/_concat").concat

-- parse a string and return numbers
-- parseNumber() => {}
-- parseNumber("") => {}
-- parseNumber("1") => {1}
-- parseNumber("1,2", ",") => {1,2}
-- parseNumber("1 2 3") => {1,2,3}
-- parseNumber("1 2 3", "%s") => {1,2,3}
M.parseNumbers = (arg_str="", sep="%s") ->
    to_numbers = (xs, accum) ->
        if #xs == 0
            return accum
        else
            if string.match(xs[1], "^%d+$") != nil
                return to_numbers (tail xs), (append accum, (tonumber(xs[1])))
            elseif string.match(xs[1], "^%d+-%d+$") != nil
                a, b = string.match(xs[1], "^(%d+)-(%d+)$")
                return to_numbers (tail xs), (concat accum, (range tonumber(a), tonumber(b)))
            else
                return to_numbers (tail xs), accum
    return (to_numbers (split arg_str, sep), {})
return M

