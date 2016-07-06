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
M.merge = function(table1, table2)
  local condition1 = (type(table1)) == "table"
  local condition2 = (type(table2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return table1
  end
  if not condition1 then
    return table2
  end
  local output = { }
  for k, v in pairs(table1) do
    if v ~= nil then
      output[k] = v
    end
  end
  for k, v in pairs(table2) do
    if v ~= nil then
      output[k] = v
    end
  end
  return output
end
M.full_module_name = function(parent, name)
  return string.format("%s.%s", parent, name)
end
M.submodules = function(parent_name, name_list)
  if (type(name_list)) ~= 'table' then
    return { }
  end
  local aux
  aux = function(name_list, accum)
    if #name_list == 0 then
      return accum
    else
      local bare_name = name_list[1]
      local full_name = M.full_module_name(parent_name, bare_name)
      local m = (require(full_name))
      if m == nil then
        return print("ERROR: cannot import module " .. full_name)
      else
        return aux((M.tail(name_list)), (M.merge(accum, {
          [bare_name] = m
        })))
      end
    end
  end
  return aux(name_list, { })
end
M.subfunctions = function(target_module, parent_name, name_list)
  if (type(name_list)) ~= 'table' then
    return { }
  end
  local aux
  aux = function(name_list, accum)
    if #name_list == 0 then
      return accum
    else
      local bare_name = name_list[1]
      local full_name = M.full_module_name(parent_name, bare_name)
      local m = (require(full_name))
      if m == nil then
        return print("ERROR: cannot import module " .. full_name)
      else
        return aux((M.tail(name_list)), (M.merge(accum, {
          [bare_name] = m[name]
        })))
      end
    end
  end
  return aux(name_list, { })
end
M.test_module = function(target_module)
  for name, test in pairs(target_module) do
    local result = test[name]()
    if result == false then
      return false
    end
  end
  return true
end
M.require_function = function(module_name)
  return require(module_name)[module_name]
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
