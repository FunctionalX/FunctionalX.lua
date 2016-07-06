local M = {}
local parent = ...
local TK = require("PackageToolkit")
local tests = {
    "test_next"
}
TK.subfunctions(M, parent, tests)
return M