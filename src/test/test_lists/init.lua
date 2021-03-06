local TK = require("PackageToolkit")
local M = { }
local me = ...
local name = "test_lists"
local members = {
  "test_append",
  "test_next",
  "test_concat2",
  "test_concat",
  "test_take",
  "test_drop",
  "test_cart2",
  "test_cart",
  "test_flatten",
  "test_merge2",
  "test_merge",
  "test_reverse",
  "test_replicate"
}
local T = TK.module.submodules(me, members)
M[name] = function()
  return TK.test.self(T)
end
return M
