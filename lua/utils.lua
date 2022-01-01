local M = {}

M.opts = { noremap = true, silent = true }

function M._map(mode, from, to, opts)
  vim.api.nvim_set_keymap(mode, from, to, opts)
end

function M.map(mode, from, to)
  M._map(mode, from, to, M.opts)
end

function M.nmap(from, to)
  M._map("n", from, to, M.opts)
end

function M.expr(mode, from, to)
  M._map(mode, from, to, { noremap = true, expr = true })
end

function M.get_config(name)
  return string.format("require[[%s]].setup()", name)
end

return M
