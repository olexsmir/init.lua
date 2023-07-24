local function map(from, to)
  vim.keymap.set("n", from, to, {
    buffer = true,
    noremap = true,
    silent = true,
  })
end

return {
  common = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    if client.name == "gopls" then
      vim.lsp.codelens.refresh()
    end

    if client.name == "clojure_lsp" then
      client.server_capabilities.documentFormattingProvider = true
    end

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint(bufnr, true)
    end

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
    map("<leader>ll", vim.lsp.codelens.run)
    map("]d", vim.diagnostic.goto_next)
    map("[d", vim.diagnostic.goto_prev)
  end,
  null_ls = function(_, _)
    map("<leader>li", "<cmd>LspInfo<cr>")
    map("<leader>lf", "<cmd>lua vim.lsp.buf.format {async = true}<cr>")
    map("]d", vim.diagnostic.goto_next)
    map("[d", vim.diagnostic.goto_prev)
  end,
}
