return {
  ---@param mode string|table
  ---@param from string
  ---@param to string|function
  ---@param buffer? number|boolean
  map = function(mode, from, to, buffer)
    vim.keymap.set(mode, from, to, {
      noremap = true,
      silent = true,
      buffer = buffer or false,
    })
  end,
}
