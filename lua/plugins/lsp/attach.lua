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

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(bufnr, true)
    end

    map("K", vim.lsp.buf.hover)
    map("gd", "<cmd>Telescope lsp_definitions<cr>")
    map("gr", "<cmd>Telescope lsp_references<cr>")
    map("gi", "<cmd>Telescope lsp_implementations<cr>")
    map("gl", vim.diagnostic.open_float)
    map("<leader>la", vim.lsp.buf.code_action)
    map("<leader>lr", vim.lsp.buf.rename)
    map("<leader>lf", "<cmd>lua vim.lsp.buf.format {async = true}<cr>")
    map("<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>")
    map("<leader>ll", vim.lsp.codelens.run)
    map("]d", vim.diagnostic.goto_next)
    map("[d", vim.diagnostic.goto_prev)

    map("<leader>li", function()
      if vim.lsp.inlay_hint.is_enabled(bufnr) then
        vim.lsp.inlay_hint.enable(bufnr, false)
      else
        vim.lsp.inlay_hint.enable(bufnr, true)
      end
    end)
  end,
  null_ls = function(_, _)
    map("<leader>lf", "<cmd>lua vim.lsp.buf.format {async = true}<cr>")
    map("]d", vim.diagnostic.goto_next)
    map("[d", vim.diagnostic.goto_prev)
  end,
}
