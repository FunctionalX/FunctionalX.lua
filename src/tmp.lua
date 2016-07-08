package.path = package.path .. ";?/init.lua"
local TK = require("PackageToolkit")

local T =  TK.subfunctions("FunctionalX._strings",{"_cartn"})



local T2 = TK.subfunctions("functionalX._strings",{"_cart2"})
print(unpack(T.cartn({"a"},{"1","2"})))

-- local L = TK.submodules("FunctionalX", {"_lists"})
-- for k, v in pairs(L.lists) do
--     print(k,v)
-- end

equal_lists = function(list1, list2)
  print(unpack(list1))
  print(unpack(list2))
end

print(TK.equal_lists({1},{1}))