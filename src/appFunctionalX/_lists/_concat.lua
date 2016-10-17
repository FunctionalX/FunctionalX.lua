local M = { }
local TK = require("PackageToolkit")
local tail = (TK.module.import(..., "_tail")).tail
local concat2 = (TK.module.import(..., "_concat2")).concat2
M.concat = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(input, accum)
    if #input == 0 then
      return accum
    end
    return aux((tail(input)), (concat2(accum, input[1])))
  end
  return aux(args, { })
end
return M
