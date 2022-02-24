return function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local function buf_map(...)
    vim.api.nvim_buf_set_keymap(bufnr, "n", ...)
  end

  local opts = { noremap = true, silent = true }
  buf_map("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_map("gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  buf_map("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_map("gr", "<cmd>Telescope lsp_references<CR>", opts)
  buf_map("gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  buf_map("gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_map("gl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
end
