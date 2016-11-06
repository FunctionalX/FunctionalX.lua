local M = { }
M.add_brackets = function(s, prefix, indent, pretty, expand)
  if pretty == nil then
    pretty = false
  end
  if expand == nil then
    expand = false
  end
  if pretty == false then
    if expand == false then
      return string.format("{ %s }", s)
    else
      return string.format("[ list %s ]", s)
    end
  else
    if expand == false then
      return string.format("{\n%s%s%s\n%s}", prefix, indent, s, prefix)
    else
      return string.format("[ list \n%s%s%s\n%s ]", prefix, indent, s, prefix)
    end
  end
end
return M
