return {
  ---@param mode string
  ---@param from string
  ---@param to string
  ---@param expr boolean|nil
  map = function(mode, from, to, expr)
    if expr then
      vim.keymap.set(mode, from, to, { noremap = true, expr = true })
      return
    end

    vim.keymap.set(mode, from, to, { noremap = true, silent = true })
  end,

  ---@param path string
  ---@return string
  get_config = function(path)
    return string.format("require[[%s]]", path)
  end,

  ---@param path string
  ---@return string
  get_setup = function(path)
    return string.format("require[[%s]].setup()", path)
  end,
}
