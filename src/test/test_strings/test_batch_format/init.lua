local parent = ...
local case = (require(parent .. ".case"))["case"]
local M = { }
M.test_batch_format = function()
  case("p%s", {
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
