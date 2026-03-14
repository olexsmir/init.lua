vim.lsp.enable {
  "ctags",
  "gleam",
  "gopls",
  "lua_ls",
  "markdown_oxide",
  "ts_ls",
}

local map = Config.map
Config.audocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then error "couldn't get an lsp server" end

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_codeLens) then
      vim.lsp.codelens.enable(true, { bufnr = bufnr })
    end

    map("n", "<leader>lf", function()
      vim.lsp.buf.format { async = true }
    end, bufnr)

    map("n", "gd", Snacks.picker.lsp_definitions, bufnr)
    map("n", "gr", Snacks.picker.lsp_references, bufnr)
    map("n", "gi", Snacks.picker.lsp_implementations, bufnr)
    map("n", "gl", vim.diagnostic.open_float, bufnr)
    map("n", "<leader>la", vim.lsp.buf.code_action, bufnr)
    map("n", "<leader>lr", vim.lsp.buf.rename, bufnr)
    map("n", "<leader>ll", vim.lsp.codelens.run, bufnr)
    map("n", "<leader>lS", Snacks.picker.lsp_symbols)
    map("n", "<leader>ls", Snacks.picker.lsp_workspace_symbols)
    map("n", "<leader>li", function()
      if vim.lsp.inlay_hint.is_enabled { bufnr = bufnr } then
        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
        vim.print "Inlay hints disabled"
      else
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        vim.print "Inlay hints enabled"
      end
    end, bufnr)
  end,
})
