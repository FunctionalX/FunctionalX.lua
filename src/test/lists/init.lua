local parent = ...
local TK = require("PackageToolkit")
local tests = {
    "test_next"
}
local  M = TK.subfunctions(parent, tests)
return M