-- concatenate many lists into one
M = {}
TK = require("PackageToolkit")
tail = (TK.module.import ..., "_tail").tail
concat2 = (TK.module.import ..., "_concat2").concat2

-- concatenate many lists
M.concat = (...) ->
    args = {...}
    aux = (input, accum) ->
        return accum if #input == 0
        return aux (tail input), (concat2 accum, input[1])

    return aux args, {}

return M