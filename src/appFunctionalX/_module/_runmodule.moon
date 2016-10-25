M = {}
T = (require "PackageToolkit").module 
parseFirstNumberGroup = (T.import ..., "../_strings/_parseFirstNumberGroup").parseFirstNumberGroup
head = (T.import ..., "../_lists/_head").head
tail = (T.import ..., "../_lists/_tail").tail
append = (T.import ..., "../_lists/_append").append
range = (T.import ..., "../_numeric/_range").range
join = (T.import ..., "../_strings/_join").join

-- Examples: 
--   run({m1,m2}) will run all the modules m1 and m2
--   run({m1,m2}, "1,1") will run m1 and give the list {1} to m2.main()
--   run({m1,m2}, "1,1 2") will run m1 and give the list {1,2} to m2.main()
M.runmodule = (modules, exe, arg_str="", sep1=",", sep2=" ") ->
    -- if exe==true, pass the indices to each module's main()
    -- otherwise pass the rest of the argument string
    if #{modules} == 0
        return {}

    if arg_str == ""
        return M.runmodule modules, exe, (join sep2, unpack (range 1, #modules, 1))

    indices, rest_str = parseFirstNumberGroup arg_str, sep1, sep2

    aux = (indices, modules, accum) ->
        if #indices == 0
            return accum
        else
            i = head indices
            if i > #modules
                print (string.format "ERROR HINT: index %s > #modules (i.e., %s)", i, #modules)
                return accum
            else
                result = nil
                if exe == true
                    indices, _ = parseFirstNumberGroup rest_str, sep1, sep2
                    result = modules[i].main unpack indices
                else
                    result = modules[i].main rest_str
                return aux (tail indices), modules, (append accum, result)
    return aux indices, modules, {}
return M


