M = {}
name = "test_chop"
__ = ...
FX = require "FunctionalX"
TK = require("PackageToolkit")
case = TK.test.case
M[name] = -> 
    fn = FX.directory.chop
    case fn, {"a.b.c"}, {"a"..FX.os.pathsep().."b"}, "directory.chop case 1"
    case fn, {"a/b/c"}, {"a/b"}, "directory.chop case 2"
    case fn, {"a\\b\\c"}, {"a\\b"}, "directory.chop case 3"
    case fn, {"a"}, {""}, "directory.chop case 4"
    case fn, {""}, {""}, "directory.chop case 5"
    return true

return M