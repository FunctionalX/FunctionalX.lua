local M = { }
local name1 = "strings"
local name2 = "join"
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
M.case = function(input1, input2, solution, msg)
  if msg == nil then
    msg = ""
  end
  print(TK.ui.dashed_line(80, '-'))
  print(string.format("test %s.%s()", name1, name2))
  print(msg)
  print("input2", unpack(input2))
  local result = FX[name1][name2](input1, unpack(input2))
  print(string.format("Result: \"%s\"", result))
  print(string.format("Solution: \"%s\"", solution))
  assert(result == solution)
  print("VERIFIED!")
  return print(TK.ui.dashed_line(80, '-'))
end
return M
