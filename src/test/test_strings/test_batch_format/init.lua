local parent = ...
local TK = require("PackageToolkit")
local test_case = (require(parent .. ".test_case"))["test_case"]
local M = { }
M.test_batch_format = function()
  test_case("p%s", {
    1,
    2,
    3
  }, {
    "p1",
    "p2",
    "p3"
  })
  return true
end
return M
