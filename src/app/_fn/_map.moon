-- Apply a function a list of values
-- and return the results as a list
TK = require "PackageToolkit"
M = {}
me = ...
root = TK.module.root me
head = TK.module.require root.."._lists._head", "head"
tail = TK.module.require root.."._lists._tail", "tail"
append = TK.module.require root.."._lists._append", "append"

M.map = (f, list) ->
    aux = (f, list, accum) ->
        if #list == 0
            return accum
        else
            return aux f, (tail list), (append accum, (f (head list)))
    return {} if (type list) != "table"
    return aux f, list, {}
return M