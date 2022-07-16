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

    map("K", vim.lsp.buf.hover)
    map("gd", "<cmd>Telescope lsp_definitions<cr>")
    map("gD", vim.lsp.buf.declaration)
    map("gr", "<cmd>Telescope lsp_references<cr>")
    map("gi", "<cmd>Telescope lsp_implementations<cr>")
    map("gs", vim.lsp.buf.signature_help)
    map("gl", vim.diagnostic.open_float)
    map("<leader>li", "<cmd>LspInfo<cr>")
    map("<leader>la", vim.lsp.buf.code_action)
    map("<leader>lr", vim.lsp.buf.rename)
    map("<leader>lf", "<cmd>lua vim.lsp.buf.format {async = true}<cr>")
    map("<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>")
    map("<leader>lj", vim.diagnostic.goto_next)
    map("<leader>lk", vim.diagnostic.goto_prev)
    map("]l", vim.diagnostic.goto_next)
    map("[l", vim.diagnostic.goto_prev)
  end,
  null_ls = function(_, _)
    map("<leader>li", "<cmd>LspInfo<cr>")
    map("<leader>lf", "<cmd>lua vim.lsp.buf.format {async = true}<cr>")
    map("<leader>lj", vim.diagnostic.goto_next)
    map("<leader>lk", vim.diagnostic.goto_prev)
    map("]l", vim.diagnostic.goto_next)
    map("[l", vim.diagnostic.goto_prev)
  end,
}
