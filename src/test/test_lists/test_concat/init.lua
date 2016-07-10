local name = "test_concat"
local parent = ...
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local solution = {
    1,
    2,
    3,
    4,
    5
  }
  case({
    {
      1,
      2
    },
    {
      3,
      4
    },
    {
      5
    }
  }, solution, "case 1")
  return true
end
return M
