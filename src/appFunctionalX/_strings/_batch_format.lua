local M = { }
local T = require("PackageToolkit").module
local L = T.import(..., "..", "..", "_lists")
M.batch_format = function(format_template, variable_list)
  local aux
  aux = function(format_template, variable_list, accum)
    if #variable_list == 0 then
      return accum
    else
      local item = string.format(format_template, variable_list[1])
      return aux(format_template, (L.tail(variable_list)), (L.append(accum, item)))
    end
  end
  return aux(format_template, variable_list, { })
end
return M
