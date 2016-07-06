M = {}

-- return the tail of a list
M.tail = (list, start_index=1) ->
    return {} if (type list) != "table"
    return {} if #list <= 1
    return [list[i] for i = (start_index+1), #list]

M.submodules = (target_module, parent_name, module_names) ->
    return {} if (type target_module) != 'table'
    for i, name in ipairs(module_names) do
        target_module[name] = require(string.format("%s.%s", parent_name, name))
    return target_module

M.subfunctions = (target_module, parent_name, function_names) ->
    return {} if (type target_module) != 'table'
    for i, name in ipairs(function_names) do
        submodule_name = string.format("%s.%s", parent_name, name)
        submodule = require(submodule_name)
        if type(submodule) == "table"
            target_module[name] = submodule[name] 
        else
            print string.format "ERROR HINT: %s cannot be found", submodule_name
    return target_module

M.test = (host, submodules) ->
    for name in *submodules
        for k, f in pairs(host[name])
            f()


M.dashed_line = (n, symbol="-") ->
    aux = (n, symbol, accum) ->
        if n == 0
            return accum
        else
            return aux (n-1), symbol, accum..symbol
    return aux n, symbol, ""

return M