package.path = package.path .. ";?.lua"
local config = {
  module = "autoscript"
}
local legal_flags = {
  "-a",
  "-f",
  "-t"
}
local usage = [[Usage: auto target1 
       auto target1 -f my_autoscript 
       auto target1 -f my_autoscript -a arg1 arg2
]]
local head
head = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list == 0 then
    return nil
  end
  return list[1]
end
local tail
tail = function(list, start_index)
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
local init
init = function(list)
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
local concat
concat = function(list1, list2)
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
local merge
merge = function(table1, table2)
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
local append
append = function(list, item)
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
local prepend
prepend = function(item, list)
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
local is_flag
is_flag = function(str)
  if str == nil then
    return false
  end
  for _index_0 = 1, #legal_flags do
    local x = legal_flags[_index_0]
    if str == x then
      return true
    end
  end
  return false
end
local is_not_flag
is_not_flag = function(str)
  return not (is_flag(str))
end
local next
next = function(list)
  if (type(list)) ~= "table" then
    return nil
  end
  if #list >= 2 then
    return list[2]
  else
    return nil
  end
end
local parse
parse = function(input, config, targets, args, flag)
  if flag == nil then
    flag = "-t"
  end
  if #input == 0 then
    return config, targets, args
  end
  if is_flag((head(input))) then
    return parse((tail(input)), config, targets, args, (head(input)))
  end
  local _exp_0 = flag
  if "-t" == _exp_0 then
    return parse((tail(input)), config, (append(targets, (head(input)))), args, "-t")
  elseif "-f" == _exp_0 then
    return parse((tail(input)), (merge(config, {
      module = (head(input))
    })), targets, args, "-t")
  elseif "-a" == _exp_0 then
    return parse((tail(input)), config, targets, (append(args, (head(input)))), "-a")
  else
    return parse({ }, config, targets, args)
  end
end
local dashed_line
dashed_line = function(n, symbol, accum)
  if symbol == nil then
    symbol = "-"
  end
  if accum == nil then
    accum = ""
  end
  if n == 0 then
    return accum
  else
    return dashed_line(n - 1, symbol, symbol .. accum)
  end
end
local work
work = function(module_name, targets, args)
  local M = require(module_name)
  for _index_0 = 1, #targets do
    local target = targets[_index_0]
    if M[target] ~= nil then
      M[target](unpack(args))
    end
  end
end
local main
main = function(input, default_config)
  if #input == 0 then
    return usage
  end
  local user_config, user_targets, user_args = parse(input, default_config, { }, { })
  work(user_config.module, user_targets, user_args)
  return dashed_line(80)
end
return print(main(arg, config))
