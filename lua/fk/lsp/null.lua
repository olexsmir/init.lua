local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
  sources = {
    code_actions.gitrebase,

    formatting.stylua,
    diagnostic.selene,
    formatting.gofumpt,
    formatting.goimports,
    -- diagnostic.golangci_lint,
    formatting.black,
    formatting.isort,
    diagnostic.flake8,
  },
}
