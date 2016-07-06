package.path = package.path..";?.lua"

FX = require "FunctionalX"

config = {
    module: "autoscript"
}

legal_flags = {
    "-a", -- user arguments
    "-f", -- user config file module name
    "-t", -- user target names
}

usage = [[
Usage: auto target1 
       auto target1 -f my_autoscript 
       auto target1 -f my_autoscript -a arg1 arg2
]]


-- check whether a string is a flag
is_flag = (str) ->
    return false if str == nil 
    for x in *legal_flags
        if str == x
            return true
    return false

-- check whether a string is not a flag
is_not_flag = (str) -> not (is_flag str)


-- parse command line arguments
parse = (input, config, targets, args, flag="-t") ->
    return config, targets, args if #input == 0
    if is_flag (FX.head input)
        return parse (FX.tail input), config, targets, args, (FX.head input)
    switch flag
        when "-t" then return parse (FX.tail input), config, (FX.append targets, (FX.head input)), args, "-t"
        when "-f" then return parse (FX.tail input), (FX.merge config, {module: (FX.head input)}), targets, args, "-t"
        when "-a" then return parse (FX.tail input), config, targets, (FX.append args, (FX.head input)), "-a"
        else return parse {}, config, targets, args

dashed_line = (n, symbol="-", accum="") ->
    if n == 0
        return accum
    else
        return dashed_line n - 1, symbol, symbol..accum

work = (module_name, targets, args) ->
    M = require module_name
    for target in *targets
        M[target] unpack args if M[target] != nil


main = (input, default_config) ->
    return usage if #input == 0
    user_config, user_targets, user_args = parse input, default_config, {}, {}
    work user_config.module, user_targets, user_args
    return dashed_line 80

print main arg, config