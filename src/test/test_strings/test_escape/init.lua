local M = { }
local name = "test_escape"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = FX.strings.escape
  local _ = (case(fn, {
    "a"
  }, {
    "a"
  }, "strings.parseNumbers case 0"))
  _ = (case(fn, {
    "a",
    { }
  }, {
    "a"
  }, "strings.parseNumbers case 1"))
  _ = (case(fn, {
    '"',
    {
      '"'
    }
  }, {
    '\\"'
  }, "strings.parseNumbers case 2"))
  _ = (case(fn, {
    '"[]',
    {
      '"',
      '[',
      ']'
    }
  }, {
    '\\"\\[\\]'
  }, "strings.parseNumbers case 3"))
  return true
end
return M
