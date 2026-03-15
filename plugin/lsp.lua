vim.lsp.enable {
  "ctags",
  "gleam",
  "gopls",
  "lua_ls",
  "markdown_oxide",
  "ts_ls",
}

Config.aucmd("LspAttach", nil, function(ev)
  local bufnr = ev.buf
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if not client then error "couldn't get an lsp server" end

  if client:supports_method(vim.lsp.protocol.Methods.textDocument_codeLens) then
    vim.lsp.codelens.enable(true, { bufnr = bufnr })
  end

  Config.map("n", "<leader>lf", function()
    vim.lsp.buf.format { async = true }
  end, bufnr)

  Config.map("n", "gd", Snacks.picker.lsp_definitions, bufnr)
  Config.map("n", "gr", Snacks.picker.lsp_references, bufnr)
  Config.map("n", "gi", Snacks.picker.lsp_implementations, bufnr)
  Config.map("n", "gl", vim.diagnostic.open_float, bufnr)
  Config.map("n", "<leader>la", vim.lsp.buf.code_action, bufnr)
  Config.map("n", "<leader>lr", vim.lsp.buf.rename, bufnr)
  Config.map("n", "<leader>ll", vim.lsp.codelens.run, bufnr)
  Config.map("n", "<leader>lS", Snacks.picker.lsp_symbols, bufnr)
  Config.map("n", "<leader>ls", Snacks.picker.lsp_workspace_symbols, bufnr)
  Config.map("n", "<leader>li", function()
    if vim.lsp.inlay_hint.is_enabled { bufnr = bufnr } then
      vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
      vim.print "Inlay hints disabled"
    else
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      vim.print "Inlay hints enabled"
    end
  end, bufnr)
end)
