local u = require "core.utils"

vim.lsp.enable {
  "elmls",
  "golangci_lint_ls",
  "gopls",
  "jsonls",
  "lua_ls",
  "markdown_oxide",
  "ts_ls",
  "yamlls",
}

u.aucmd("LspAttach", {
  group = u.augroup "lsp",
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      error "couldn't get an lsp server"
    end

    if
      client:supports_method(vim.lsp.protocol.Methods.textDocument_codeLens)
    then
      vim.lsp.codelens.refresh { bufnr = bufnr }
    end

    u.map("n", "<leader>lf", function()
      vim.lsp.buf.format { async = true }
    end, bufnr)

    u.map("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", bufnr)
    u.map("n", "gr", "<cmd>lua Snacks.picker.lsp_references()<cr>", bufnr)
    u.map("n", "gi", "<cmd>lua Snacks.picker.lsp_implementations()<cr>", bufnr)
    u.map("n", "gl", vim.diagnostic.open_float, bufnr)
    u.map("n", "<leader>la", vim.lsp.buf.code_action, bufnr)
    u.map("n", "<leader>lr", vim.lsp.buf.rename, bufnr)
    u.map("n", "<leader>ss", "<cmd>lua Snacks.picker.lsp_symbols()<cr>", bufnr)
    u.map("n", "<leader>ll", vim.lsp.codelens.run, bufnr)
    u.map("n", "<leader>li", function()
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
