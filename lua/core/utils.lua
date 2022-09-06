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

  get = {
    ---@param path string
    ---@return string
    config = function(path)
      return string.format("require[[configs.%s]]", path)
    end,

    ---@param path string
    ---@return string
    setup = function(path)
      return string.format("require[[%s]].setup()", path)
    end,
  },
}
