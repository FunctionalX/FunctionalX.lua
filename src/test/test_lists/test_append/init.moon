name = "test_append"
parent = ...
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    solution = {1,2,3}
    case {{}, 1, 2, 3}, solution, "case 1"
    return true

return M