name = "test_merge"
parent = ...
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    solution = {
        "a":1,
        "b":2,
        "c":3,
    }
    case {{"a":1}, {"b":2}, {"c":3}}, solution, "case 1"
    return true

return M