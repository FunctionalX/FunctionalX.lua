local M = { }
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
M.test_case = function(input1, solution, msg)
  if msg == nil then
    msg = ""
  end
  print(TK.dashed_line(80, '-'))
  print("test strings.path()")
  print(msg, unpack(input1))
  local result = FX.directory.path(unpack(input1))
  print("Result: ", result)
  assert(result == solution)
  print("VERIFIED!")
  return print(TK.dashed_line(80, '-'))
end
return M
