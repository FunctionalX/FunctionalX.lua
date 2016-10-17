local M = { }
local name = "test_parseNumbers"
local me = ...
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local case = TK.test.case
M[name] = function()
  local fn = FX.strings.parseNumbers
  local indent = "  "
  local _ = (case(fn, {
    ","
  }, {
    { },
    { }
  }, "strings.parseNumbers case 1"))
  _ = (case(fn, {
    ",",
    "1"
  }, {
    {
      1
    },
    { }
  }, "strings.parseNumbers case 2"))
  _ = (case(fn, {
    ",",
    "1,2"
  }, {
    {
      1
    },
    {
      "2"
    }
  }, "strings.parseNumbers case 3"))
  _ = (case(fn, {
    ",",
    "1 2,3"
  }, {
    {
      1,
      2
    },
    {
      "3"
    }
  }, "strings.parseNumbers case 4"))
  _ = (case(fn, {
    ",",
    "1,2 3"
  }, {
    {
      1
    },
    {
      "2 3"
    }
  }, "strings.parseNumbers case 5"))
  _ = (case(fn, {
    ",",
    "1 2"
  }, {
    {
      1,
      2
    },
    { }
  }, "strings.parseNumbers case 6"))
  _ = (case(fn, {
    ",",
    "1,2, 3"
  }, {
    {
      1
    },
    {
      "2, 3"
    }
  }, "strings.parseNumbers case 7"))
  _ = (case(fn, {
    ",",
    " 1"
  }, {
    {
      1
    },
    { }
  }, "strings.parseNumbers case 8"))
  _ = (case(fn, {
    ",",
    "1,  3"
  }, {
    {
      1
    },
    {
      "  3"
    }
  }, "strings.parseNumbers case 9"))
  _ = (case(fn, {
    ",",
    "2,1,1"
  }, {
    {
      2
    },
    {
      "1,1"
    }
  }, "strings.parseNumbers case 10"))
  return true
end
return M
