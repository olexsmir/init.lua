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
  buf_map("gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
  buf_map("<leader>li", "<cmd>LspInfo<cr>")
  buf_map("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  buf_map("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
  buf_map("<leader>lf", "<cmd>lua vim.lsp.buf.format {async = true}<cr>")
  buf_map("<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>")
  buf_map("<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>")
  buf_map("<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
end
