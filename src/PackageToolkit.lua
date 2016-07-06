local M = { }
M.tail = function(list, start_index)
  if start_index == nil then
    start_index = 1
  end
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = (start_index + 1), #list do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
M.submodules = function(target_module, parent_name, module_names)
  if (type(target_module)) ~= 'table' then
    return { }
  end
  for i, name in ipairs(module_names) do
    target_module[name] = require(string.format("%s.%s", parent_name, name))
  end
  return target_module
end
M.subfunctions = function(target_module, parent_name, function_names)
  if (type(target_module)) ~= 'table' then
    return { }
  end
  for i, name in ipairs(function_names) do
    local submodule_name = string.format("%s.%s", parent_name, name)
    local submodule = require(submodule_name)
    if type(submodule) == "table" then
      target_module[name] = submodule[name]
    else
      print(string.format("ERROR HINT: %s cannot be found", submodule_name))
    end
  end
  return target_module
end
M.test = function(host, submodules)
  for _index_0 = 1, #submodules do
    local name = submodules[_index_0]
    for k, f in pairs(host[name]) do
      f()
    end
  end
end
M.dashed_line = function(n, symbol)
  if symbol == nil then
    symbol = "-"
  end
  local aux
  aux = function(n, symbol, accum)
    if n == 0 then
      return accum
    else
      return aux((n - 1), symbol, accum .. symbol)
    end
  end
  return aux(n, symbol, "")
end
return M
