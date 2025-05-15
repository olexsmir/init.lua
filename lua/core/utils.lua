local lsp_root_markers = { ".git" }

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
    default_markers = lsp_root_markers,

    ---@param extend? string[]
    root_marker = function(extend)
      return vim.tbl_extend("force", lsp_root_markers, extend or {})
    end,

    ---@param extend? table
    capabilities = function(extend)
      return vim.tbl_extend(
        "force",
        require("cmp_nvim_lsp").default_capabilities(),
        extend or {}
      )
    end,
  },
}
