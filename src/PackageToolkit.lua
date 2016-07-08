local M = { }
M.split = function(str, symbol)
  if symbol == nil then
    symbol = "%s"
  end
  local _accum_0 = { }
  local _len_0 = 1
  for x in string.gmatch(str, "([^" .. symbol .. "]+)") do
    _accum_0[_len_0] = x
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
M.module_prefix = function(full_module_name)
  return (string.gsub((string.match(full_module_name, ".+%.")), ".$", "")) or ""
end
M.module_root = function(full_module_name)
  return (M.split(full_module_name, "."))[1] or ""
end
M.head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
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
M.remove_prefix = function(str, symbol)
  return string.gsub(str, "^_+", "")
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
      local raw_name = name_list[1]
      local bare_name = M.remove_prefix(raw_name, "_")
      local full_name = M.full_module_name(parent_name, raw_name)
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
M.subfunctions = function(parent_name, name_list)
  if (type(name_list)) ~= 'table' then
    return { }
  end
  local aux
  aux = function(name_list, accum)
    if #name_list == 0 then
      return accum
    else
      local raw_name = name_list[1]
      local bare_name = M.remove_prefix(raw_name, "_")
      local full_name = M.full_module_name(parent_name, raw_name)
      local m = (require(full_name))
      if m == nil then
        return print("ERROR: cannot import module " .. full_name)
      else
        return aux((M.tail(name_list)), (M.merge(accum, {
          [bare_name] = m[bare_name]
        })))
      end
    end
  end
  return aux(name_list, { })
end
M.module_member = function(full_module_name, member_name)
  return (require(full_module_name))[member_name]
end
M.test_module = function(target_module)
  for name, test in pairs(target_module) do
    if test[name] == nil then
      print(string.format("ERROR HINT: %s() doesn't exist", name))
    end
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
M.equal_lists = function(list1, list2)
  if (type(list1)) ~= "table" then
    return false
  end
  if (type(list2)) ~= "table" then
    return false
  end
  local condition1 = #list1 == 0
  local condition2 = #list2 == 0
  if condition1 and not condition2 then
    return false
  end
  if condition2 and not condition1 then
    return false
  end
  if condition1 and condition2 then
    return true
  end
  if list1[1] == list2[1] then
    return M.equal_lists((M.tail(list1)), (M.tail(list2)))
  else
    return false
  end
end
return M
