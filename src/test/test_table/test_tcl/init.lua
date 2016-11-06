local M = { }
local name = "test_tcl"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = FX.table.tcl
  local indent = "  "
  local _ = (case(fn, {
    {
      k1 = 1,
      k2 = 2
    },
    true,
    false
  }, {
    (string.format("{\n%sk1 1\n%sk2 2\n}", indent, indent))
  }, "table.tcl case 1"))
  _ = (case(fn, {
    {
      ["k 1 "] = 1,
      k2 = 2
    },
    true,
    false
  }, {
    (string.format("{\n%s{k 1} 1\n%sk2 2\n}", indent, indent))
  }, "table.tcl case 2"))
  _ = (case(fn, {
    {
      ["k 1"] = {
        h1 = 1,
        h2 = 2
      },
      k2 = 2
    },
    true,
    false
  }, {
    (string.format("{\n%s{k 1} {\n%s%sh1 1\n%s%sh2 2\n%s}\n%sk2 2\n}", indent, indent, indent, indent, indent, indent, indent))
  }, "table.tcl case 3"))
  _ = (case(fn, {
    {
      a = 1
    },
    false,
    false
  }, {
    "{ a 1 }"
  }, "table.tcl case 4"))
  _ = (case(fn, {
    {
      a = 1
    },
    false,
    true
  }, {
    "[ list a 1 ]"
  }, "table.tcl case 5"))
  _ = (case(fn, {
    {
      a = "1 2"
    },
    false,
    true
  }, {
    "[ list a [ join [ list 1 2 ] ] ]"
  }, "table.tcl case 6"))
  return true
end
return M
