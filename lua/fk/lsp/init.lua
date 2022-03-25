local diagnostic = require "fk.lsp.diagnostic"
local M = {}

function M.setup()
  vim.diagnostic.config(diagnostic)
  for _, sign in ipairs(diagnostic.signs.active) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  require "fk.lsp.null"
  require("nvim-lsp-installer").on_server_ready(function(server)
    local opts = {
      on_attach = require "fk.lsp.attach",
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = { debounce_text_changes = 150 },
    }

    opts = require "fk.lsp.providers"(server, opts)

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
