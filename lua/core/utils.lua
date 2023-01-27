return {
  ---@param mode string|table
  ---@param from string
  ---@param to string|function
  map = function(mode, from, to)
    vim.keymap.set(mode, from, to, { noremap = true, silent = true })
  end,

  ---@param mode string|table
  ---@param from string
  ---@param to string|function
  expr = function(mode, from, to)
    vim.keymap.set(mode, from, to, { noremap = true, expr = true })
  end,

  smap = function(module, method)
    return string.format("<cmd>lua require'%s'.%s()<cr>", module, method)
  end
}
