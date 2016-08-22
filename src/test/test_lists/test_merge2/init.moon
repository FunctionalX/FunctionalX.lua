name = "test_merge2"
parent = ...
case = (require parent..".case")["case"]
M = {}
M[name] = -> 
    solution = {
        "a":1,
        "b":2,
    }
    case {{"a":1}, {"b":2}}, solution, "case 1"
    return true

return M