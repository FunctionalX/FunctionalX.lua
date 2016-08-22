name = "test_replicate"
parent = ...
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    solution = {1,1,1}
    case {3, 1}, solution, "case 1"
    return true

return M