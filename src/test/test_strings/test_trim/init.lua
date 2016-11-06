local M = { }
local name = "test_trim"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = FX.strings.trim
  local _ = (case(fn, {
    " a ",
    "%s"
  }, {
    "a"
  }, "strings.trim case 1"))
  _ = (case(fn, {
    "\n \t \r a \n \t \r",
    "%s"
  }, {
    "a"
  }, "strings.trim case 2"))
  _ = (case(fn, {
    "\n \t \r a b \n \t \r",
    "%s"
  }, {
    "a b"
  }, "strings.trim case 3"))
  _ = (case(fn, {
    "{a}",
    "[{}]"
  }, {
    "a"
  }, "strings.trim case 4"))
  return true
end
return M
