-- Apply a function a list of values
-- and return the results as a list
TK = require "PackageToolkit"
M = {}
tail = (TK.module.import ..., '..', "..", '_lists', '_tail').tail
head = (TK.module.import ..., '..', "..", '_lists', '_head').head
append = (TK.module.import ..., '..', '..', '_lists', '_append').append

M.map = (f, list) ->
    aux = (f, list, accum) ->
        if #list == 0
            return accum
        else
            return aux f, (tail list), (append accum, (f (head list)))
    return {} if (type list) != "table"
    return aux f, list, {}
return M