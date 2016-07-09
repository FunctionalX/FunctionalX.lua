local M = { }
local name1 = "lists"
local name2 = "next"
local TK = require("PackageToolkit")
local FX = require("FunctionalX")
M.case = function(input, solution, msg)
  if msg == nil then
    msg = ""
  end
  print(TK.ui.dashed_line(80, '-'))
  print(string.format("test %s.%s()", name1, name2))
  print(msg)
  assert((FX[name1][name2](input)) == solution)
  print("VERIFIED!")
  return print(TK.ui.dashed_line(80, '-'))
end
return M
