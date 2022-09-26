require "configs.lsp.diagnostic"()
require "configs.lsp.inlayhints"
require "configs.lsp.null-ls"
require("mason-lspconfig").setup {
  ensure_installed = { "sumneko_lua" },
}

local lspconfig = require "lspconfig"
local options = {
  on_attach = require("configs.lsp.attach").common,
  flags = { debounce_text_changes = 150 },
  capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
}

require("lua-dev").setup {}
for name, conf in pairs(require "configs.lsp.servers") do
  lspconfig[name].setup(vim.tbl_extend("force", options, conf))
end
