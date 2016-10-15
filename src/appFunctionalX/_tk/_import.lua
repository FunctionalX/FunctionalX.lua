local M = { }
M.import = function(me, module_name)
  if (string.match(me, "[/%.]")) == nil then
    return module_name
  else
    local current_path = string.match(me, "(.-)[/%.]?[^%./]+$")
    return require((string.format("%s/%s", current_path, module_name)))
  end
end
return M
