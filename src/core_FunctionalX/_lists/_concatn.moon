M = {}
TK = require("PackageToolkit")
me = ...
root_parent = TK.module.root me
tail = TK.module.require root_parent.."._lists._tail", "tail"
concat = TK.module.require root_parent.."._lists._concat", "concat"

-- concatenate two lists
M.concatn = (...) ->
    args = {...}
    aux = (input, accum) ->
        return accum if #input == 0
        return aux (tail input), (concat accum, input[1])

    return aux args, {}

return M