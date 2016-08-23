local name = "test_append"
local parent = ...
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local solution = {
    1,
    2,
    3
  }
  case({
    { },
    1,
    2,
    3
  }, solution, "case 1")
  return true
end
return M
