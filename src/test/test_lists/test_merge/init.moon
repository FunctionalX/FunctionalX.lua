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

    case {}, {}, "case 2: test empty input"
    return true

return M