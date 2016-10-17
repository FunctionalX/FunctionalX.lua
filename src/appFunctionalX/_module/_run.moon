M = {}
T = (require "PackageToolkit").module 
parse = (T.import ..., "../_strings/_parseNumbers").parseNumbers
head = (T.import ..., "../_lists/_head").head
tail = (T.import ..., "../_lists/_tail").tail
append = (T.import ..., "../_lists/_append").append
range = (T.import ..., "../_numeric/_range").range
join = (T.import ..., "../_strings/_join").join

M.run = (modules, ...) ->
    sep = ","
    if #{modules} == 0
        return {}

    if #{...} == 0 
        return M.run modules, (join " ", unpack (range 1, #modules, 1))

    indices, rest = parse sep, ...

    aux = (indices, modules, accum) ->
        if #indices == 0
            return accum
        else
            i = head indices
            if i > #modules
                print (string.format "ERROR HINT: index %s > #modules (i.e., %s)", i, #modules)
                return accum
            else
                result = modules[i].main unpack rest
                return aux (tail indices), modules, (append accum, result)
    return aux indices, modules, {}
return M


