local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics

null_ls.setup {
  on_attach = require("configs.lsp.attach").null_ls,
  sources = {
    formatting.stylua,
    diagnostic.selene,
    formatting.black,
    diagnostic.flake8,
    formatting.isort,
    diagnostic.golangci_lint,
    formatting.gofumpt,
    formatting.goimports,
    formatting.golines,
  },
}
