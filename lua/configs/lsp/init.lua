require "configs.lsp.diagnostic"()
require "configs.lsp.null-ls"
require("nvim-lsp-installer").on_server_ready(function(server)
  server:setup(require "configs.lsp.providers"(server, {
    on_attach = require "configs.lsp.attach",
    flags = { debounce_text_changes = 150 },
    capabilities = require("cmp_nvim_lsp").update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
  }))
  vim.cmd [[ do User LspAttachBuffers ]]
end)
