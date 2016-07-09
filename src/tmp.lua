package.path = package.path .. ";?/init.lua"
local TK = require("raw_PackageToolkit._lists")
print(TK.head({1,2}))