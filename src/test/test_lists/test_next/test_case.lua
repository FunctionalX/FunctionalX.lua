local M = { }
local TK = require("PackageToolkit")
M.test_case = function(input, solution, msg)
  if msg == nil then
    msg = ""
  end
  print(TK.dashed_line(80, '-'))
  print("test next()")
  print(msg)
  assert((next(input)) == solution)
  print("VERIFIED!")
  return print(TK.dashed_line(90, '-'))
end
return M
