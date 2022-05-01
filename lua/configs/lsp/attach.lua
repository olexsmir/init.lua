return function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  client.server_capabilities.documentFormattingProvider = false

  local function buf_map(from, to)
    vim.api.nvim_buf_set_keymap(bufnr, "n", from, to, {
      noremap = true,
      silent = true,
    })
  end

  buf_map("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
  buf_map("gd", "<cmd>Telescope lsp_definitions<cr>")
  buf_map("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  buf_map("gr", "<cmd>Telescope lsp_references<cr>")
  buf_map("gi", "<cmd>Telescope lsp_implementations<cr>")
  buf_map("gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
  buf_map("gl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
end
