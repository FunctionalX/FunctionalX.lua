name = "test_reverse"
parent = ...
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    solution = {3,2,1}
    case {{1,2,3}}, solution, "case 1"
    return true

return M