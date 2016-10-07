-- concatenate many lists into one
M = {}
TK = require("PackageToolkit")
me = ...
root_parent = TK.module.root me
tail = TK.module.require root_parent.."._lists._tail", "tail"
concat2 = TK.module.require root_parent.."._lists._concat2", "concat2"

-- concatenate many lists
M.concat = (...) ->
    args = {...}
    aux = (input, accum) ->
        return accum if #input == 0
        return aux (tail input), (concat2 accum, input[1])

    return aux args, {}

return M