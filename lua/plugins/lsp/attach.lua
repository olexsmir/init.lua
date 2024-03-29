local u = require "core.utils"
local attach = {}

function attach.basic(_, _)
  u.map("n", "<leader>lf", function()
    vim.lsp.buf.format { async = true }
  end, true)
  u.map("n", "]d", function()
    vim.diagnostic.goto_next { float = false }
  end, true)
  u.map("n", "[d", function()
    vim.diagnostic.goto_prev { float = false }
  end, true)

  u.map("n", "]D", vim.diagnostic.goto_next, true)
  u.map("n", "[D", vim.diagnostic.goto_prev, true)
end

function attach.common(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  if client.name == "gopls" then
    vim.lsp.codelens.refresh()
  end

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(bufnr, true)
  end

  attach.basic(client, bufnr)

  u.map("n", "K", vim.lsp.buf.hover, true)
  u.map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", true)
  u.map("n", "gr", "<cmd>Telescope lsp_references<cr>", true)
  u.map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", true)
  u.map("n", "gl", vim.diagnostic.open_float, true)
  u.map("n", "<leader>la", vim.lsp.buf.code_action, true)
  u.map("n", "<leader>lr", vim.lsp.buf.rename, true)
  u.map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", true)
  u.map("n", "<leader>ll", vim.lsp.codelens.run, true)
  u.map("n", "<leader>li", function()
    if vim.lsp.inlay_hint.is_enabled(bufnr) then
      vim.lsp.inlay_hint.enable(bufnr, false)
      vim.print "Inlay hints disabled"
    else
      vim.lsp.inlay_hint.enable(bufnr, true)
      vim.print "Inlay hints enabled"
    end
  end, true)
end

return attach
