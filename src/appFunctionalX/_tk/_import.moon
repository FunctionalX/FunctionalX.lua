M = {}
M.import = (me, module_name) ->
    -- 'me': the current caller's module path which is captured by "..."
    -- "module_name": name of the module that lives in the same directory as the caller
    --
    -- developer's note: ".-" matches any character 0 or more times as few as possible
    -- "(.-)" captures the matching
    -- [^%./] means any character not in the set where "%" is the escaping symbol
    --     i.e, the "." is the literal "."
    -- "+" means 1 or more times
    -- when using "-" the ends must be anchored, that's why the end mark "$" is necessary
    if (string.match me, "[/%.]") == nil -- if both caller and callee modules live at the root directory
        return module_name
    else
        current_path = string.match(me, "(.-)[/%.]?[^%./]+$") -- example "a.b/c.d" => "a.b/c"
        return require (string.format "%s/%s", current_path, module_name)
return M