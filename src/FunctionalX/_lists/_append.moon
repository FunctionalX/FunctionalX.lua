M = {}
-- append an item a list
M.append = (list, item) ->
    return {item} if (type list) != "table" and item != nil
    return table  if (type list) == "table" and item == nil
    return {}     if (type list) != "table" and item == nil
    output = [x for x in *list]
    output[#output+1] = item
    return output
return M