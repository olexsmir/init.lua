return {
  ---@param mode string
  ---@param from string
  ---@param to string
  ---@param expr boolean
  map = function(mode, from, to, expr)
    if expr then
      vim.keymap.set(mode, from, to, { noremap = true, expr = true })
      return
    end

    vim.keymap.set(mode, from, to, { noremap = true, silent = true })
  end,
}
