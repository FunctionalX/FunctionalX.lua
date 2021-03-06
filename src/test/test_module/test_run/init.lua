local M = { }
local name = "test_run"
local FX = require("FunctionalX")
local TK = require("PackageToolkit")
local m1 = FX.module.initimport(..., "m1")
local m2 = FX.module.initimport(..., "m2")
local m3 = FX.module.initimport(..., "m3")
local m4 = FX.module.initimport(..., "m4")
local case = TK.test.case
M[name] = function()
  local fn1 = FX.module.call
  local fn2 = FX.module.run
  print(fn1)
  print(fn2)
  case(fn1, {
    {
      m1
    }
  }, {
    {
      "m1"
    }
  }, "module.run case 1")
  case(fn1, {
    {
      m1
    },
    "9999"
  }, {
    { }
  }, "module.run case 2")
  case(fn1, {
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
  case(fn1, {
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
  case(fn1, {
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
  case(fn1, {
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
  case(fn1, {
    {
      m1,
      m2,
      m4
    },
    "3,1,1,1"
  }, {
    {
      "hello 1"
    }
  }, "module.run case 7")
  case(fn1, {
    {
      m1,
      m2,
      m4
    },
    "1 3,1,1,2"
  }, {
    {
      "m1",
      "hello 2"
    }
  }, "module.run case 8")
  return true
end
return M
