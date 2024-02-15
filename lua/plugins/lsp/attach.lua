local attach = {}

local function map(from, to)
  vim.keymap.set("n", from, to, {
    buffer = true,
    noremap = true,
    silent = true,
  })
end

function attach.basic(_, _)
  map("<leader>lf", function()
    vim.lsp.buf.format { async = true }
  end)
  map("]d", function()
    vim.diagnostic.goto_next { float = false }
  end)
  map("[d", function()
    vim.diagnostic.goto_prev { float = false }
  end)

  map("]D", vim.diagnostic.goto_next)
  map("[D", vim.diagnostic.goto_prev)
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

  map("K", vim.lsp.buf.hover)
  map("gd", "<cmd>Telescope lsp_definitions<cr>")
  map("gr", "<cmd>Telescope lsp_references<cr>")
  map("gi", "<cmd>Telescope lsp_implementations<cr>")
  map("gl", vim.diagnostic.open_float)
  map("<leader>la", vim.lsp.buf.code_action)
  map("<leader>lr", vim.lsp.buf.rename)
  map("<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>")
  map("<leader>ll", vim.lsp.codelens.run)

  map("<leader>li", function()
    if vim.lsp.inlay_hint.is_enabled(bufnr) then
      vim.lsp.inlay_hint.enable(bufnr, false)
      vim.print "Inlay hints disabled"
    else
      vim.lsp.inlay_hint.enable(bufnr, true)
      vim.print "Inlay hints enabled"
    end
  end)
end

return attach
