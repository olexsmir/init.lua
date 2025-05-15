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
      if extend == nil then
        return lsp_root_markers
      end

      local r = vim.deepcopy(lsp_root_markers)
      for _, v in ipairs(extend) do
        table.insert(r, v)
      end
      return r
    end,

    ---@param extend? table
    capabilities = function(extend)
      return vim.tbl_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        extend or {}
      )
    end,
  },
}
