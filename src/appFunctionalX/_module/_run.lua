local M = { }
local T = (require("PackageToolkit")).module
local parse = (T.import(..., "..", "..", "_strings", "_parseNumbers")).parseNumbers
local head = (T.import(..., "..", "..", "_lists", "_head")).head
local tail = (T.import(..., "..", "..", "_lists", "_tail")).tail
local append = (T.import(..., "..", "..", "_lists", "_append")).append
local range = (T.import(..., "..", "..", "_numeric", "_range")).range
local join = (T.import(..., "..", "..", "_strings", "_join")).join
M.run = function(modules, ...)
  local sep = ","
  if #{
    modules
  } == 0 then
    return { }
  end
  if #{
    ...
  } == 0 then
    return M.run(modules, (join(" ", unpack((range(1, #modules, 1))))))
  end
  local indices, rest = parse(sep, ...)
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
        local result = modules[i].main(unpack(rest))
        return aux((tail(indices)), modules, (append(accum, result)))
      end
    end
  end
  return aux(indices, modules, { })
end
return M
