name = "test_concatn"
parent = ...
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    solution = {1,2,3,4,5}
    case {{1,2},{3,4},{5}}, solution, "case 1"
    return true

return M