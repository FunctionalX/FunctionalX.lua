#!/usr/bin/env lua

do

do
local _ENV = _ENV
package.preload[ "PackageToolkit" ] = function( ... ) local arg = _G.arg;


do

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._strings" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "split"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._case" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local split
split = function(str, symbol)
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
local root1 = (split(parent, "."))[1]
local dashed_line = require(root1 .. "." .. "._ui._dashed_line")["dashed_line"]
local equal_lists = require(root1 .. "." .. "._test._equal_lists")["equal_lists"]
M.case = function(fn, inputs, solution, msg)
  if msg == nil then
    msg = ""
  end
  print(dashed_line(80, '-'))
  print(msg)
  local result = fn(unpack(inputs))
  if type(solution) == "table" then
    print("Result: ", unpack(result))
    print("Solution: ", unpack(solution))
  else
    print("Result: ", result)
    print("Solution: ", solution)
  end
  assert(equal_lists(result, solution))
  print("VERIFIED!")
  print(dashed_line(80, '-'))
  return true
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._self" ] = function( ... ) local arg = _G.arg;
local M = { }
M.self = function(target_module)
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
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._submodules" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
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
local root1 = (split(parent, "."))[1]
local root2 = (split(parent, "."))[2]
local module_root = root1 .. "." .. root2
local get_full_name = require(module_root .. "._full_name")["full_name"]
local remove_prefix = require(module_root .. "._remove_prefix")["remove_prefix"]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local merge = require(root1 .. "." .. "._lists._merge")["merge"]
local M = { }
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
      local bare_name = remove_prefix(raw_name, "_")
      local full_name = get_full_name(parent_name, raw_name)
      local m = (require(full_name))
      if m == nil then
        return error("ERROR: cannot import module " .. full_name)
      elseif (type(m)) == "boolean" then
        return error(string.format("ERROR HINT: module %s doesn't reutrn a module table", full_name))
      else
        return aux((tail(name_list)), (merge(accum, {
          [bare_name] = m
        })))
      end
    end
  end
  return aux(name_list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._full_name" ] = function( ... ) local arg = _G.arg;
local M = { }
M.full_name = function(parent, name)
  return string.format("%s.%s", parent, name)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._strings._split" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_PackageToolkit._module._remove_prefix" ] = function( ... ) local arg = _G.arg;
local M = { }
M.remove_prefix = function(str, symbol)
  if symbol == nil then
    symbol = "_"
  end
  local pattern = string.format("^%s+", symbol)
  return string.gsub(str, pattern, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._head" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_PackageToolkit.._ui._dashed_line" ] = function( ... ) local arg = _G.arg;
local M = { }
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

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._ui._dashed_line" ] = function( ... ) local arg = _G.arg;
local M = { }
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

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "root",
  "full_name",
  "remove_prefix",
  "require",
  "subfunctions",
  "submodules"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test._equal_lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
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
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local head = require(root1 .. "." .. "._lists._head")["head"]
local M = { }
M.equal_lists = function(list1, list2)
  local condition1 = (type(list1)) == 'table'
  local condition2 = (type(list2)) == 'table'
  if condition1 and not condition2 then
    return false
  end
  if condition2 and not condition1 then
    return false
  end
  if (not condition1) and (not condition2) then
    return (list1 == list2)
  end
  if #list1 ~= #list2 then
    return false
  end
  if #list1 == 0 and #list2 == 0 then
    return true
  end
  if M.equal_lists((head(list1)), (head(list2))) then
    return M.equal_lists((tail(list1)), (tail(list2)))
  else
    return false
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._tail" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_PackageToolkit.._lists._head" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_PackageToolkit.._test._equal_lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
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
local root1 = (split(parent, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local head = require(root1 .. "." .. "._lists._head")["head"]
local M = { }
M.equal_lists = function(list1, list2)
  local condition1 = (type(list1)) == 'table'
  local condition2 = (type(list2)) == 'table'
  if condition1 and not condition2 then
    return false
  end
  if condition2 and not condition1 then
    return false
  end
  if (not condition1) and (not condition2) then
    return (list1 == list2)
  end
  if #list1 ~= #list2 then
    return false
  end
  if #list1 == 0 and #list2 == 0 then
    return true
  end
  if M.equal_lists((head(list1)), (head(list2))) then
    return M.equal_lists((tail(list1)), (tail(list2)))
  else
    return false
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._merge" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_PackageToolkit._lists" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "head",
  "tail",
  "merge"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._ui" ] = function( ... ) local arg = _G.arg;
local parent = ...
local submodule_names = {
  "dashed_line"
}
local M = { }
for _index_0 = 1, #submodule_names do
  local name = submodule_names[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._test" ] = function( ... ) local arg = _G.arg;
local parent = ...
local members = {
  "self",
  "equal_lists",
  "case"
}
local M = { }
for _index_0 = 1, #members do
  local name = members[_index_0]
  M[name] = require(parent .. "._" .. name)[name]
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit" ] = function( ... ) local arg = _G.arg;
local parent = "core_PackageToolkit"
local submodule_names = {
  "lists",
  "strings",
  "module",
  "test",
  "ui"
}
local M = { }
for _index_0 = 1, #submodule_names do
  local name = submodule_names[_index_0]
  M[name] = require(parent .. "._" .. name)
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._root" ] = function( ... ) local arg = _G.arg;
local M = { }
local split
split = function(str, symbol)
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
M.root = function(full_module_name)
  return (split(full_module_name, "."))[1] or ""
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._module._subfunctions" ] = function( ... ) local arg = _G.arg;
local parent = ...
local split
split = function(str, symbol)
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
local root1 = (split(parent, "."))[1]
local root2 = (split(parent, "."))[2]
local module_root = root1 .. "." .. root2
local get_full_name = require(module_root .. "._full_name")["full_name"]
local remove_prefix = require(module_root .. "._remove_prefix")["remove_prefix"]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
local merge = require(root1 .. "." .. "._lists._merge")["merge"]
local M = { }
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
      local bare_name = remove_prefix(raw_name, "_")
      local full_name = get_full_name(parent_name, raw_name)
      local m = (require(full_name))
      if m == nil then
        return error("ERROR: cannot import module " .. full_name)
      elseif (type(m)) == "boolean" then
        return error(string.format("ERROR HINT: module %s doesn't reutrn a module table", full_name))
      else
        return aux((tail(name_list)), (merge(accum, {
          [bare_name] = m[bare_name]
        })))
      end
    end
  end
  return aux(name_list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit._lists._tail" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_PackageToolkit.._lists._merge" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_PackageToolkit._module._require" ] = function( ... ) local arg = _G.arg;
local M = { }
M.require = function(module_name, function_name)
  if function_name == nil then
    return require(module_name)[module_name]
  end
  return require(module_name)[function_name]
end
return M

end
end

end

package.path = package.path .. ";?/init.lua"
local M = require("core_PackageToolkit")
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = "core_FunctionalX"
local members = {
  "_lists",
  "_strings",
  "_directory",
  "_fn",
  "_table",
  "_numeric"
}
return TK.module.submodules(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._directory" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_path",
  "_cart2",
  "_cart"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._directory._cart" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local cart2 = TK.module.require(root_parent .. "._directory._cart2", "cart2")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.cart = function(...)
  local aux
  aux = function(list1, other_lists)
    if #other_lists == 0 then
      return list1
    else
      if type(other_lists[1]) ~= "table" then
        return aux(list1, { })
      end
      return aux((cart2(list1, other_lists[1])), (tail(other_lists)))
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
  return aux(args[1], (tail(args)))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._directory._cart2" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root = TK.module.root(me)
local tail = TK.module.require(root .. "._lists._tail", "tail")
local append = TK.module.require(root .. "._lists._append", "append")
local path = TK.module.require(root .. "._directory._path", "path")
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      return aux(list1, (tail(list2)), (append(accum, (path(list1[1], list2[1])))))
    else
      return aux((tail(list1)), list2, (aux({
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
package.preload[ "core_FunctionalX._directory._path" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
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
package.preload[ "core_FunctionalX._fn" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_map"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._fn._map" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local M = { }
local me = ...
local root = TK.module.root(me)
local head = TK.module.require(root .. "._lists._head", "head")
local tail = TK.module.require(root .. "._lists._tail", "tail")
local append = TK.module.require(root .. "._lists._append", "append")
M.map = function(f, list)
  local aux
  aux = function(f, list, accum)
    if #list == 0 then
      return accum
    else
      return aux(f, (tail(list)), (append(accum, (f((head(list)))))))
    end
  end
  if (type(list)) ~= "table" then
    return { }
  end
  return aux(f, list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_append",
  "_cart2",
  "_cart",
  "_concat2",
  "_concat",
  "_head",
  "_initial",
  "_merge2",
  "_merge",
  "_next",
  "_prepend",
  "_tail",
  "_take",
  "_drop",
  "_flatten",
  "_reverse",
  "_replicate"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists._append" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.append = function(list, ...)
  local items = {
    ...
  }
  if #items == 0 then
    return list
  end
  if (type(list)) ~= "table" and #items ~= 0 then
    return items
  end
  if (type(list)) == "table" and #items == 0 then
    return table
  end
  if (type(list)) ~= "table" and #items == 0 then
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
  for _index_0 = 1, #items do
    local item = items[_index_0]
    output[#output + 1] = item
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists._cart" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local cart2 = TK.module.require(root_parent .. "._lists._cart2", "cart2")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.cart = function(...)
  local aux
  aux = function(list1, other_lists)
    if #other_lists == 0 then
      return list1
    else
      if type(other_lists[1]) ~= "table" then
        return aux(list1, { })
      end
      return aux((cart2(list1, other_lists[1], true)), (tail(other_lists)))
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
  return aux(args[1], (tail(args)))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists._cart2" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
local append = TK.module.require(root_parent .. "._lists._append", "append")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local flatten = TK.module.require(root_parent .. "._lists._flatten", "flatten")
M.cart2 = function(list1, list2, merge)
  if merge == nil then
    merge = false
  end
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      if merge then
        return aux(list1, (tail(list2)), (append(accum, (flatten(list1[1], list2[1])))))
      else
        return aux(list1, (tail(list2)), (append(accum, {
          list1[1],
          list2[1]
        })))
      end
    else
      return aux((tail(list1)), list2, (aux({
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
package.preload[ "core_FunctionalX._lists._concat" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local concat2 = TK.module.require(root_parent .. "._lists._concat2", "concat2")
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

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists._concat2" ] = function( ... ) local arg = _G.arg;
local M = { }
M.concat2 = function(list1, list2)
  local condition1 = (type(list1)) == "table"
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
package.preload[ "core_FunctionalX._lists._drop" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local TK = require("PackageToolkit")
local root_parent = TK.module.root(me)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.drop = function(n, list)
  if (type(list)) ~= "table" then
    return { }
  end
  local aux
  aux = function(n, list)
    if n == 0 then
      return list
    elseif #list == 0 then
      return { }
    else
      return aux((n - 1), (tail(list)))
    end
  end
  return aux(n, list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists._flatten" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local head = TK.module.require(root_parent .. "._lists._head", "head")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local append = TK.module.require(root_parent .. "._lists._append", "append")
M.flatten = function(...)
  local args = {
    ...
  }
  local aux
  aux = function(lists, accum)
    if #lists == 0 then
      return accum
    elseif (type(lists[1])) == "table" then
      return aux((tail(lists)), (aux(lists[1], accum)))
    else
      return aux((tail(lists)), (append(accum, lists[1])))
    end
  end
  return aux(args, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists._head" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_FunctionalX._lists._initial" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_FunctionalX._lists._merge" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local merge2 = TK.module.require(root_parent .. "._lists._merge2", "merge2")
M.merge = function(...)
  local tables = {
    ...
  }
  local aux
  aux = function(tables, accum)
    if #tables == 0 then
      return accum
    else
      return (aux((tail(tables)), (merge2(accum, tables[1]))))
    end
  end
  if #tables == 0 then
    return { }
  elseif #tables == 1 then
    return tables[1]
  else
    return aux(tables, { })
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists._merge2" ] = function( ... ) local arg = _G.arg;
local M = { }
M.merge2 = function(table1, table2)
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
package.preload[ "core_FunctionalX._lists._next" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_FunctionalX._lists._prepend" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_FunctionalX._lists._replicate" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
local append = TK.module.require(root_parent .. "._lists._append", "append")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.replicate = function(n, item)
  local aux
  aux = function(n, item, accum)
    if n <= 0 then
      return accum
    else
      return aux((n - 1), item, (append(accum, item)))
    end
  end
  return aux(n, item, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists._reverse" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local parent = ...
local root_parent = TK.module.root(parent)
local prepend = TK.module.require(root_parent .. "._lists._prepend", "prepend")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.reverse = function(list)
  local aux
  aux = function(list, accum)
    if #list == 0 then
      return accum
    else
      return aux((tail(list)), (prepend(list[1], accum)))
    end
  end
  return aux(list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._lists._tail" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_FunctionalX._lists._take" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
local TK = require("PackageToolkit")
local root_parent = TK.module.root(me)
local append = TK.module.require(root_parent .. "._lists._append", "append")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local head = TK.module.require(root_parent .. "._lists._head", "head")
M.take = function(n, list)
  if (type(list)) ~= "table" then
    return { }
  end
  local aux
  aux = function(n, list, accum)
    if n == 0 then
      return accum
    elseif #list == 0 then
      return accum
    else
      return aux((n - 1), (tail(list)), (append(accum, (head(list)))))
    end
  end
  return aux(n, list, { })
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._numeric" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_range"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._numeric._range" ] = function( ... ) local arg = _G.arg;
local M = { }
M.range = function(start, stop, step)
  if step == nil then
    step = 1
  end
  local output = { }
  for i = start, stop, step do
    output[#output + 1] = i
  end
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._strings" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_cart2",
  "_cart",
  "_split",
  "_batch_format",
  "_join"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._strings._batch_format" ] = function( ... ) local arg = _G.arg;
local M = { }
local parent = ...
local TK = require("PackageToolkit")
local root_parent = TK.module.root(parent)
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
package.preload[ "core_FunctionalX._strings._cart" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local cart2 = TK.module.require(root_parent .. "._strings._cart2", "cart2")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
M.cart = function(...)
  local aux
  aux = function(list1, other_lists)
    if #other_lists == 0 then
      return list1
    else
      if type(other_lists[1]) ~= "table" then
        return aux(list1, { })
      end
      return aux((cart2(list1, other_lists[1])), (tail(other_lists)))
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
  return aux(args[1], (tail(args)))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._strings._cart2" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local append = TK.module.require(root_parent .. "._lists._append", "append")
M.cart2 = function(list1, list2)
  local aux
  aux = function(list1, list2, accum)
    if #list2 == 0 or #list1 == 0 then
      return accum
    elseif #list1 == 1 then
      return aux(list1, (tail(list2)), (append(accum, tostring(list1[1]) .. tostring(list2[1]))))
    else
      return aux((tail(list1)), list2, (aux({
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
package.preload[ "core_FunctionalX._strings._join" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local head = TK.module.require(root_parent .. "._lists._head", "head")
M.join = function(...)
  local args = {
    ...
  }
  local separator = head(args)
  local list = tail(args)
  local aux
  aux = function(list, accum)
    if #list == 0 then
      return accum
    else
      return aux((tail(list)), accum .. separator .. (tostring(head(list))))
    end
  end
  if #list == 0 then
    return ""
  end
  return aux((tail(list)), (tostring(head(list))))
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._strings._split" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_FunctionalX._table" ] = function( ... ) local arg = _G.arg;
local TK = require("PackageToolkit")
local parent = ...
local members = {
  "_keys",
  "_str",
  "_tcl"
}
return TK.module.subfunctions(parent, members)

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._table._keys" ] = function( ... ) local arg = _G.arg;
local M = { }
M.keys = function(t)
  local output = { }
  for k, v in pairs(t) do
    output[#output + 1] = k
  end
  table.sort(output)
  return output
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._table._str" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local get_keys = TK.module.require(root_parent .. "._table._keys", "keys")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local head = TK.module.require(root_parent .. "._lists._head", "head")
local append = TK.module.require(root_parent .. "._lists._append", "append")
M.str = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local format_key
  format_key = function(k)
    if string.match(k, "%s") then
      return string.format("[\"%s\"]", k)
    else
      return k
    end
  end
  local aux
  aux = function(dict, keys, accum, prefix)
    if #keys == 0 then
      local sep = string.format(",\n%s%s", prefix, indent)
      return add_brackets((table.concat(accum, sep)), prefix)
    else
      local k = head(keys)
      local v = ""
      if type(dict[k]) == "table" then
        v = aux(dict[k], (get_keys(dict[k])), { }, indent)
      else
        v = tostring(dict[k])
      end
      local new_item = string.format("%s = %s", (format_key(k)), v)
      return aux(dict, (tail(keys)), (append(accum, new_item)), prefix)
    end
  end
  return aux(t, (get_keys(t)), { }, "")
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_FunctionalX._table._tcl" ] = function( ... ) local arg = _G.arg;
local M = { }
local TK = require("PackageToolkit")
local me = ...
local root_parent = TK.module.root(me)
local get_keys = TK.module.require(root_parent .. "._table._keys", "keys")
local tail = TK.module.require(root_parent .. "._lists._tail", "tail")
local head = TK.module.require(root_parent .. "._lists._head", "head")
local append = TK.module.require(root_parent .. "._lists._append", "append")
M.tcl = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local format_key
  format_key = function(k)
    if string.match(k, "%s") then
      return string.format("\"%s\"", k)
    else
      return k
    end
  end
  local aux
  aux = function(dict, keys, accum, prefix)
    if #keys == 0 then
      local sep = string.format("\n%s%s", prefix, indent)
      return add_brackets((table.concat(accum, sep)), prefix)
    else
      local k = head(keys)
      local v = ""
      if type(dict[k]) == "table" then
        v = aux(dict[k], (get_keys(dict[k])), { }, indent)
      else
        v = tostring(dict[k])
      end
      local new_item = string.format("%s %s", (format_key(k)), v)
      return aux(dict, (tail(keys)), (append(accum, new_item)), prefix)
    end
  end
  return aux(t, (get_keys(t)), { }, "")
end
return M

end
end

end

package.path = package.path..";?/init.lua"
local M = require("core_FunctionalX")
return M