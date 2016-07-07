local M = { }
M.batch_format = function(format_template, variable_list)
  local aux
  aux = function(format_template, variable_list, accum)
    if #variable_list == 0 then
      return accum
    else
      local item = string.format(format_template, variable_list[1])
      return aux(format_template, (M.tail(variable_list)), (M.append(accum, item)))
    end
  end
  return aux(format_template, variable_list, { })
end
return M
