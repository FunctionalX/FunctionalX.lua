package.path = package.path .. "?/init.lua"
require("out")

FX = require("FunctionalX")

for k,v in pairs(FX) do
    print(k,v)
end


print(FX.lists.head({1,2,3}))