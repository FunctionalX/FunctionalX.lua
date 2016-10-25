local M = { }
local name = "test_chop"
local __ = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = FX.directory.chop
  case(fn, {
    "a.b.c"
  }, {
    "a" .. FX.os.pathsep() .. "b"
  }, "directory.chop case 1")
  case(fn, {
    "a/b/c"
  }, {
    "a/b"
  }, "directory.chop case 2")
  case(fn, {
    "a\\b\\c"
  }, {
    "a\\b"
  }, "directory.chop case 3")
  case(fn, {
    "a"
  }, {
    ""
  }, "directory.chop case 4")
  case(fn, {
    ""
  }, {
    ""
  }, "directory.chop case 5")
  return true
end
return M
