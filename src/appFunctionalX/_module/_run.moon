M = {}
T = (require "PackageToolkit").module 
runmodule = (T.import ..., "_runmodule").runmodule
M.run = (modules, ...) ->
   return runmodule modules, true, ...
return M


