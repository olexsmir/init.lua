local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics

null_ls.setup {
  on_attach = require("plugins.lsp.attach").null_ls,
  sources = {
    formatting.stylua,
    diagnostic.selene,
    formatting.gofumpt,
    formatting.goimports,
    formatting.golines,
    formatting.prettierd,
    diagnostic.shellcheck,
    formatting.shfmt,
  },
}
