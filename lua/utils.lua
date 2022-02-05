local M = {}

M.opts = { noremap = true, silent = true }

function M.get_config(name)
  return string.format("require[[%s]].setup()", name)
end

return M
