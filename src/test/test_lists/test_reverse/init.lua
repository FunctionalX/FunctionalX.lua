local name = "test_reverse"
local parent = ...
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local solution = {
    3,
    2,
    1
  }
  case({
    {
      1,
      2,
      3
    }
  }, solution, "case 1")
  return true
end
return M
