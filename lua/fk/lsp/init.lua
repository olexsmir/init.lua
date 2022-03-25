local M = {}

function M.setup()
  require "fk.lsp.diagnostic"()
  require "fk.lsp.null"
  require("nvim-lsp-installer").on_server_ready(function(server)
    local opts = require "fk.lsp.providers"(server, {
      on_attach = require "fk.lsp.attach",
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = { debounce_text_changes = 150 },
    })

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
