M = {}
-- prepend  an item to a list
M.prepend = (item, list) ->
    return {} if (type list) != "table"
    return list if item == nil
    output = {item}
    for x in *list
        output[#output+1] = x
    return output
return M