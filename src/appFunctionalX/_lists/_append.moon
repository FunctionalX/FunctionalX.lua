M = {}
TK = require("PackageToolkit")
parent = ...
root_parent = TK.module.root parent
tail   = TK.module.require  root_parent.."._lists._tail", "tail"

-- append an item a list
M.append = (list, ...) ->
    items = {...}
    return list   if #items == 0
    return items  if (type list) != "table" and #items != 0
    return table  if (type list) == "table" and #items == 0
    return {}     if (type list) != "table" and #items == 0
   
    -- note: a = b in Lua means let a have the address of list b
    -- Thus deep copy must be done explicitly
    output = [x for x in *list]
    for item in *items
        output[#output+1] = item
    return output
return M