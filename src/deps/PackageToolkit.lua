#!/usr/bin/env lua

do

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
local dashed_line = require(root1 .. "." .. "._ui._dashed_line").dashed_line
local equal_lists = require(root1 .. "." .. "._test._equal_lists").equal_lists
local table2str = require(root1 .. "." .. "._table._str").str
M.case = function(fn, inputs, solutions, msg)
  if msg == nil then
    msg = ""
  end
  print(dashed_line(80, '-'))
  print(msg)
  local results = {
    fn(unpack(inputs))
  }
  print("Results: ", (table2str(results)))
  print("Solutions: ", (table2str(solutions)))
  assert(equal_lists(results, solutions))
  print("VERIFIED!")
  print(dashed_line(80, '-'))
  return true
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
  "submodules",
  "import",
  "initimport",
  "ipath",
  "path"
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
package.preload[ "core_PackageToolkit._module._initimport" ] = function( ... ) local arg = _G.arg;
local M = { }
local __ = ...
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
local root1 = (split(__, "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath")["ipath"]
M.initimport = function(this_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for initimport, i.e. initimport(..., 'a/b')", (string.format("Your input is: initimport(%s, %s)", me, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (require((ipath(this_path, module_path))))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._lists._concat" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
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
local root1 = (split(me, "."))[1]
local concat2 = require(root1 .. "." .. "._lists._concat2").concat2
local tail = require(root1 .. "." .. "._lists._tail").tail
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
package.preload[ "core_PackageToolkit.._module._ipath" ] = function( ... ) local arg = _G.arg;
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
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.ipath = function(this_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local aux
  aux = function(args, prefix)
    if #args == 0 then
      return prefix
    else
      if args[1] == "." then
        return aux((tail(args)), prefix)
      elseif args[1] == ".." then
        return aux((tail(args)), (chop(prefix)))
      else
        if prefix == "" then
          return aux((tail(args)), args[1])
        else
          return aux((tail(args)), (string.format("%s.%s", prefix, args[1])))
        end
      end
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for ipath, i.e. ipath(..., 'a/b')", (string.format("Your input is: ipath(%s, %s)", this_path, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (aux((split(module_path, "/")), this_path))
  end
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
package.preload[ "core_PackageToolkit.._lists._append" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
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
local root1 = (split(me, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
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
package.preload[ "core_PackageToolkit._module._import" ] = function( ... ) local arg = _G.arg;
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
local tail = require(root1 .. "." .. "._lists._tail").tail
local initimport = require(root1 .. "." .. "._module._initimport").initimport
M.import = function(current_module_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for import, i.e. import(..., 'a/b')", (string.format("Your input is: import(%s, %s)", current_module_path, module_path))))
  if current_module_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return initimport(chop(current_module_path), module_path)
  end
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
package.preload[ "core_PackageToolkit._module._path" ] = function( ... ) local arg = _G.arg;
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
local root1 = (split(..., "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath").ipath
M.path = function(current_module_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for path, i.e. path(..., 'a/b')", (string.format("Your input is: path(%s, %s)", current_module_path, module_path))))
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  if current_module_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return ipath(chop(current_module_path), module_path)
  end
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
package.preload[ "core_PackageToolkit.._module._initimport" ] = function( ... ) local arg = _G.arg;
local M = { }
local __ = ...
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
local root1 = (split(__, "."))[1]
local ipath = require(root1 .. "." .. "._module._ipath")["ipath"]
M.initimport = function(this_path, module_path)
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for initimport, i.e. initimport(..., 'a/b')", (string.format("Your input is: initimport(%s, %s)", me, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (require((ipath(this_path, module_path))))
  end
end
return M

end
end

do
local _ENV = _ENV
package.preload[ "core_PackageToolkit.._table._keys" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
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
local root1 = (split(me, "."))[1]
local concat = require(root1 .. "." .. "._lists._concat").concat
M.keys = function(t)
  local strs = { }
  local numbers = { }
  local others = { }
  for k, v in pairs(t) do
    if type(k) == "number" then
      numbers[#numbers + 1] = k
    elseif type(k) == "string" then
      strs[#strs + 1] = k
    else
      others[#others + 1] = k
    end
  end
  table.sort(strs)
  return concat(numbers, strs, others)
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
package.preload[ "core_PackageToolkit.._lists._concat2" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "core_PackageToolkit.._table._str" ] = function( ... ) local arg = _G.arg;
local M = { }
local me = ...
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
local root1 = (split(me, "."))[1]
local tail = require(root1 .. "." .. "._lists._tail").tail
local head = require(root1 .. "." .. "._lists._head").head
local append = require(root1 .. "." .. "._lists._append").append
local get_keys = require(root1 .. "." .. "._table._keys").keys
M.str = function(t, indent)
  if indent == nil then
    indent = "  "
  end
  local add_brackets
  add_brackets = function(s, prefix)
    return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
  end
  local bracket
  bracket = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("[%s]", obj)
    else
      return tostring(obj)
    end
  end
  local quote
  quote = function(obj)
    if type(obj) == "string" and string.match(obj, "%s") then
      return string.format("\"%s\"", obj)
    else
      return tostring(obj)
    end
  end
  local format_item
  format_item = function(k, v)
    if type(k) == "number" then
      return string.format("%s", v)
    else
      return string.format("%s = %s", (bracket((quote(k)))), v)
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
        v = aux(dict[k], (get_keys(dict[k])), { }, prefix .. indent)
      else
        v = quote(dict[k])
      end
      local new_item = format_item(k, v)
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
package.preload[ "core_PackageToolkit._module._ipath" ] = function( ... ) local arg = _G.arg;
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
local tail = require(root1 .. "." .. "._lists._tail")["tail"]
M.ipath = function(this_path, module_path)
  local chop
  chop = function(path)
    if (string.match(path, "[/%.]")) == nil then
      return ""
    else
      return string.match(path, "(.-)[/%.]?[^%./]+$")
    end
  end
  local aux
  aux = function(args, prefix)
    if #args == 0 then
      return prefix
    else
      if args[1] == "." then
        return aux((tail(args)), prefix)
      elseif args[1] == ".." then
        return aux((tail(args)), (chop(prefix)))
      else
        if prefix == "" then
          return aux((tail(args)), args[1])
        else
          return aux((tail(args)), (string.format("%s.%s", prefix, args[1])))
        end
      end
    end
  end
  local err = (string.format("%s\n%s\n", "ERROR HINT: there must be two arguments for ipath, i.e. ipath(..., 'a/b')", (string.format("Your input is: ipath(%s, %s)", this_path, module_path))))
  if this_path == nil or module_path == nil then
    print(err)
    return nil
  else
    return (aux((split(module_path, "/")), this_path))
  end
end
return M

end
end

end

package.path = package.path .. ";?/init.lua"
local M = require("core_PackageToolkit")
return M
