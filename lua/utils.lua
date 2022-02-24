local M = {}

function M.get_setup(path)
  return string.format("require[[%s]].setup()", path)
end

function M.get_config(path)
  return string.format("require[[%s]]", path)
end

return M
