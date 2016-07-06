local M = { }
local TK = require("PackageToolkit")
local test
test = function(input, solution)
  print(TK.dashed_line(80, '-'))
  print("test next()")
  assert((next(input)) == solution)
  print("VERIFIED!")
  return print(TK.dashed_line(90, '-'))
end
M.test_next = function()
  return test({
    1,
    2
  }, 1)
end
return M
