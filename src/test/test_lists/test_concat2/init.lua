local name = "test_concat2"
local parent = ...
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local solution = {
    1,
    2,
    3,
    4
  }
  case({
    {
      1,
      2
    },
    {
      3,
      4
    }
  }, solution, "case 1")
  return true
end
return M
