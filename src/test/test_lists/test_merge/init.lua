local name = "test_merge"
local parent = ...
local case = (require(parent .. ".case"))["case"]
local M = { }
M[name] = function()
  local solution = {
    ["a"] = 1,
    ["b"] = 2,
    ["c"] = 3
  }
  case({
    {
      ["a"] = 1
    },
    {
      ["b"] = 2
    },
    {
      ["c"] = 3
    }
  }, solution, "case 1")
  case({ }, { }, "case 2: test empty input")
  return true
end
return M
