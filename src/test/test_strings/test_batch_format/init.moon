parent = ...
case = (require parent..".case")["case"]
M = {}
M.test_batch_format = -> 
    case "p%s", {1,2,3}, {"p1","p2","p3"}
    return true

return M