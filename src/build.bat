del amalg.cache
lua -lamalg FunctionalX.lua
lua amalg.lua -s FunctionalX.lua -c -o ..\release\FunctionalX.lua
copy ..\release\FunctionalX.lua ..\..\luapower
