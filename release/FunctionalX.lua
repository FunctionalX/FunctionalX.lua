do
local _ENV = _ENV
package.preload[ "FunctionalX" ] = function( ... ) local arg = _G.arg;
local parent = "FunctionalX"
local TK = require("PackageToolkit")
local submodule_names = {
    "_lists",
    "_strings",
    "_directory",
}
local  M = TK.submodules(parent, submodule_names)
return M
end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._directory" ] = function( ... ) local arg = _G.arg;
-- "..." will be provided by require() function
local parent_module_name = ... 
local module_functions = {
    "_path"
}
local TK = require("PackageToolkit")
local  M = TK.subfunctions(parent_module_name, module_functions)
return M
end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._directory._path" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module_root(parent)
local L = require(root_parent .. "._lists")
local S = require(root_parent .. "._strings")
M.path = function(...)
  local dir_separator = L.head(S.split(package.config))
  local aux
  aux = function(subdirs, accum)
    if #subdirs == 0 then
      return accum
    else
      return aux((L.tail(subdirs)), accum .. dir_separator .. tostring(subdirs[1]))
    end
  end
  local args = {
    ...
  }
  if #args == 0 then
    return ""
  end
  if #args == 1 then
    return args[1]
  end
  return aux((L.tail(args)), (tostring(args[1])))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._lists" ] = function( ... ) local arg = _G.arg;
-- "..." will be provided by require() function
local parent_module_name = ... 
local module_functions = {
    "_append",
    "_concat",
    "_head",
    "_initial",
    "_merge",
    "_next",
    "_prepend",
    "_tail",
}
local TK = require("PackageToolkit")
local  M = TK.subfunctions(parent_module_name, module_functions)
return M
end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._lists._append" ] = function( ... ) local arg = _G.arg;
local M = { }
M.append = function(list, item)
  if (type(list)) ~= "table" and item ~= nil then
    return {
      item
    }
  end
  if (type(list)) == "table" and item == nil then
    return table
  end
  if (type(list)) ~= "table" and item == nil then
    return { }
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for _index_0 = 1, #list do
      local x = list[_index_0]
      _accum_0[_len_0] = x
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  output[#output + 1] = item
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._lists._concat" ] = function( ... ) local arg = _G.arg;
local M = { }
M.concat = function(list1, list2)
  local ondition1 = (type(list1)) == "table"
  local condition2 = (type(list2)) == "table"
  if (not condition1) and (not condition2) then
    return { }
  end
  if not condition2 then
    return list1
  end
  if not condition1 then
    return list2
  end
  local output
  do
    local _accum_0 = { }
    local _len_0 = 1
    for i = 1, #list1 do
      _accum_0[_len_0] = list1[i]
      _len_0 = _len_0 + 1
    end
    output = _accum_0
  end
  for _index_0 = 1, #list2 do
    local item = list2[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._lists._head" ] = function( ... ) local arg = _G.arg;
local M = { }
M.head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._lists._initial" ] = function( ... ) local arg = _G.arg;
local M = { }
M.init = function(list)
  if (type(list)) ~= "table" then
    return { }
  end
  if #list <= 1 then
    return { }
  end
  local _accum_0 = { }
  local _len_0 = 1
  for i = 1, #list - 1 do
    _accum_0[_len_0] = list[i]
    _len_0 = _len_0 + 1
  end
  return _accum_0
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._lists._merge" ] = function( ... ) local arg = _G.arg;
local M = { }
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
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._lists._next" ] = function( ... ) local arg = _G.arg;
local M = { }
M.next = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list >= 2 then
    return list[2]
  else
    return nil
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._lists._prepend" ] = function( ... ) local arg = _G.arg;
local M = { }
M.prepend = function(item, list)
  if (type(list)) ~= "table" then
    return { }
  end
  if item == nil then
    return list
  end
  local output = {
    item
  }
  for _index_0 = 1, #list do
    local x = list[_index_0]
    output[#output + 1] = x
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._lists._tail" ] = function( ... ) local arg = _G.arg;
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
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._strings" ] = function( ... ) local arg = _G.arg;
-- "..." will be provided by require() function
local parent_module_name = ... 
local module_functions = {
    "_cart2",
    "_cartn",
    "_split",
    "_batch_format",
}
local TK = require("PackageToolkit")
local  M = TK.subfunctions(parent_module_name, module_functions)
return M
end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._strings._batch_format" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local TK = require("PackageToolkit")
local root_parent = TK.module_root(parent)
local L = require(root_parent .. "." .. "_lists")
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

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._strings._cart2" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module_root(parent)
local L = require(root_parent .. "." .. "_lists")
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      return aux(list1, (L.tail(list2)), (L.append(accum, list1[1] .. list2[1])))
    else
      return aux((L.tail(list1)), list2, (aux({
        list1[1]
      }, list2, accum)))
    end
  end
  if type(list1) ~= "table" then
    return { }
  end
  if type(list2) ~= "table" then
    return { }
  end
  return aux(list1, list2, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._strings._cartn" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module_root(parent)
local L = require(root_parent .. "." .. "_lists")
local cart2 = TK.module_member(root_parent .. "._strings._cart2", "cart2")
M.cartn = function(...)
  local aux
  aux = function(list1, other_lists)
    if #other_lists == 0 then
      return list1
    else
      if type(other_lists[1]) ~= "table" then
        return aux(list1, { })
      end
      return aux((cart2(list1, other_lists[1])), (L.tail(other_lists)))
    end
  end
  local args = {
    ...
  }
  if type(args) ~= "table" then
    return { }
  end
  if #args == 0 then
    return { }
  end
  if type(args[1]) ~= "table" then
    return { }
  end
  if #args <= 1 then
    return args[1]
  end
  return aux(args[1], (L.tail(args)))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "FunctionalX._strings._split" ] = function( ... ) local arg = _G.arg;
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
return M

end
end

do
local _ENV = _ENV
package.preload[ "PackageToolkit" ] = function( ... ) local arg = _G.arg;
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

end
end

