local M = { }
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
M.test_case = function(input1, solution, msg)
  if msg == nil then
    msg = ""
  end
  print(TK.dashed_line(80, '-'))
  print("test lists.concatn()")
  print(msg)
  local result = FX.lists.concatn(unpack(input1))
  print("Result: ", unpack(result))
  assert(TK.equal_lists(result, solution))
  print("VERIFIED!")
  return print(TK.dashed_line(80, '-'))
end
return M
