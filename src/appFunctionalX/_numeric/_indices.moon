M = {}
T = require("PackageToolkit").module
parseNumbers  = (T.import ..., "../_strings/_parseNumbers").parseNumbers
-- If only one input is given, returns the range between 1 and n
-- If more than one input are given, return the list of numbers starting from
-- the 2nd argument
-- indices(3) return {1,2,3}
-- indices(3, 1,2) returns {1,2}
-- If a string is given as the second argument, 
-- then it will be parsed and split by " "
M.indices = (n=1, ...) ->
    args = {...}
    if #args == 0
        return [i for i = 1, n]
    else
        if type(args[1]) == "number"
            return args
        elseif type(args[1]) == "string"
            return parseNumbers args[1],  " "
        else 
            print "WARNING: unrecognized second argument to FX.numeric.indices(): " .. tostring(args[1])
            return {}
return M