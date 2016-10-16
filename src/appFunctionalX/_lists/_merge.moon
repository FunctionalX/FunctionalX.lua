-- Merge any number of hash tables (nil values will be removed)
M = {}
TK = require("PackageToolkit")
tail = (TK.module.import ..., "..", "_tail").tail
merge2 = (TK.module.import ..., "..", "_merge2").merge2

M.merge = (...) ->
    tables = {...}
    aux = (tables, accum) ->
        if #tables == 0
            return accum
        else
            return (aux (tail tables), (merge2 accum, tables[1]))

    if #tables == 0
        return {}
    elseif #tables == 1
        return tables[1]
    else
        return aux tables, {}

return M