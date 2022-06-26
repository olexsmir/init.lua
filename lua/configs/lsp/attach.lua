local function map(from, to)
  vim.keymap.set("n", from, to, {
    buffer = true,
    noremap = true,
    silent = true,
  })
end

return {
  common = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    client.server_capabilities.documentFormattingProvider = false

    map("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
    map("gd", "<cmd>Telescope lsp_definitions<cr>")
    map("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    map("gr", "<cmd>Telescope lsp_references<cr>")
    map("gi", "<cmd>Telescope lsp_implementations<cr>")
    map("gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    map("gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
    map("<leader>li", "<cmd>LspInfo<cr>")
    map("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    map("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
    map("<leader>lf", "<cmd>lua vim.lsp.buf.format {async = true}<cr>")
    map("<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>")
    map("<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>")
    map("<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
  end,
  null_ls = function(_, _)
    map("<leader>li", "<cmd>LspInfo<cr>")
    map("<leader>lf", "<cmd>lua vim.lsp.buf.format {async = true}<cr>")
    map("<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>")
    map("<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
  end,
}
