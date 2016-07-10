local M = { }
local name1 = "directory"
local name2 = "cart"
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
M.case = function(inputs, solution, msg)
  if msg == nil then
    msg = ""
  end
  print(TK.ui.dashed_line(80, '-'))
  print(string.format("test %s.%s()", name1, name2))
  print(msg)
  local result = FX[name1][name2](unpack(inputs))
  print("Result:", unpack(result))
  print("Solution:", unpack(solution))
  assert(TK.test.equal_lists(result, solution))
  print("VERIFIED!")
  return print(TK.ui.dashed_line(80, '-'))
end
return M
