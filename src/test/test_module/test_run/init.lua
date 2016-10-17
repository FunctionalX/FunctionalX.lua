local M = { }
local name = "test_run"
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local m1 = TK.module.initimport(..., "m1")
local m2 = TK.module.initimport(..., "m2")
local m3 = TK.module.initimport(..., "m3")
local m4 = TK.module.initimport(..., "m4")
local case = TK.test.case
M[name] = function()
  local fn = FX.module.run
  case(fn, {
    {
      m1
    }
  }, {
    {
      "m1"
    }
  }, "module.run case 1")
  case(fn, {
    {
      m1
    },
    "9999"
  }, {
    { }
  }, "module.run case 2")
  case(fn, {
    {
      m1,
      m2
    },
    "1"
  }, {
    {
      "m1"
    }
  }, "module.run case 3")
  case(fn, {
    {
      m1,
      m2
    },
    "2"
  }, {
    {
      "m2"
    }
  }, "module.run case 4")
  case(fn, {
    {
      m1,
      m2
    },
    "1 2"
  }, {
    {
      "m1",
      "m2"
    }
  }, "module.run case 5")
  case(fn, {
    {
      m1,
      m2,
      m3
    },
    "3,1"
  }, {
    {
      "n1"
    }
  }, "module.run case 6")
  case(fn, {
    {
      m1,
      m2,
      m4
    },
    "3,1,1"
  }, {
    {
      "p1"
    }
  }, "module.run case 7")
  case(fn, {
    {
      m1,
      m2,
      m4
    },
    "1 3,1,1"
  }, {
    {
      "m1",
      "p1"
    }
  }, "module.run case 8")
  return true
end
return M
