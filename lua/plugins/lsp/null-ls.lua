local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics

null_ls.setup {
  on_attach = require("plugins.lsp.attach").basic,
  sources = {
    formatting.stylua,
    diagnostic.selene,
    formatting.goimports,
    formatting.golines,
    formatting.prettierd,
  },
}
