me = ...
M = {}
FX = require "FunctionalX"
m1 = FX.module.import me, "m1"
M.hello = () -> m1.hello()
return M