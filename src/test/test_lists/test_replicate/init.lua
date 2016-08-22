local name = "test_replicate"
local parent = ...
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local solution = {
    1,
    1,
    1
  }
  case({
    3,
    1
  }, solution, "case 1")
  return true
end
return M
