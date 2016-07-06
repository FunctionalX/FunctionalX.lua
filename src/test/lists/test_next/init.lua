local parent = ...
local TK = require("PackageToolkit")
local test_case = TK.subfunctions(parent, {
  "test_case"
})["test_case"]
M.test_next = function()
  test_case({
    1,
    2
  }, 1, "test case 1")
  return true
end
return M
