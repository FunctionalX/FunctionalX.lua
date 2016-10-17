M = {}
M.main = (...) -> 
    output = {}
    for i in *{...}
        output[#output+1] = string.format "hello %d", i
    return unpack output
return M