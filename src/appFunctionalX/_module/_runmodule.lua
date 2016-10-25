local M = { }
local T = (require("PackageToolkit")).module
local parseFirstNumberGroup = (T.import(..., "../_strings/_parseFirstNumberGroup")).parseFirstNumberGroup
local head = (T.import(..., "../_lists/_head")).head
local tail = (T.import(..., "../_lists/_tail")).tail
local append = (T.import(..., "../_lists/_append")).append
local range = (T.import(..., "../_numeric/_range")).range
local join = (T.import(..., "../_strings/_join")).join
M.runmodule = function(modules, exe, arg_str, sep1, sep2)
  if arg_str == nil then
    arg_str = ""
  end
  if sep1 == nil then
    sep1 = ","
  end
  if sep2 == nil then
    sep2 = " "
  end
  if #{
    modules
  } == 0 then
    return { }
  end
  if arg_str == "" then
    return M.runmodule(modules, exe, (join(sep2, unpack((range(1, #modules, 1))))))
  end
  local indices, rest_str = parseFirstNumberGroup(arg_str, sep1, sep2)
  local aux
  aux = function(indices, modules, accum)
    if #indices == 0 then
      return accum
    else
      local i = head(indices)
      if i > #modules then
        print((string.format("ERROR HINT: index %s > #modules (i.e., %s)", i, #modules)))
        return accum
      else
        local result = nil
        if exe == true then
          local _
          indices, _ = parseFirstNumberGroup(rest_str, sep1, sep2)
          result = modules[i].main(unpack(indices))
        else
          result = modules[i].main(rest_str)
        end
        return aux((tail(indices)), modules, (append(accum, result)))
      end
    end
  end
  return aux(indices, modules, { })
end
return M
