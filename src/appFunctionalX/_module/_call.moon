M = {}
T = (require "PackageToolkit").module 
runmodule = (T.import ..., "_runmodule").runmodule
M.call = (modules, ...) ->
   return runmodule modules, false, ...
return M


