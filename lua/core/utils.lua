return {
  ---@param mode string|table
  ---@param from string
  ---@param to string|function
  ---@param buffer? integer|boolean
  map = function(mode, from, to, buffer)
    vim.keymap.set(mode, from, to, {
      noremap = true,
      silent = true,
      buffer = buffer or false,
    })
  end,

  aucmd = vim.api.nvim_create_autocmd,

  ---@param name string
  ---@return integer
  augroup = function(name)
    return vim.api.nvim_create_augroup("olexsmir_" .. name, { clear = true })
  end,

  lsp = {
    ---@param extend? table
    capabilities = function(extend)
      return require("blink.cmp").get_lsp_capabilities(extend or {})
    end,

    ---get list of lsp servers connected to current buffer
    ---@return string[]
    get_clients = function()
      return vim
        .iter(vim.lsp.get_clients { bufnr = 0 })
        :map(function(e)
          return (e.name ~= "null-ls" and e.name) or nil
        end)
        :totable()
    end,
  },
}
