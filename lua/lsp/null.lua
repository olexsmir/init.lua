local M = {}

function M.setup()
  local null_ls = require "null-ls"
  local formatting = null_ls.builtins.formatting
  local diagnostic = null_ls.builtins.diagnostics

  null_ls.setup {
    sources = {
      formatting.stylua,
      diagnostic.selene,
      formatting.gofumpt,
      formatting.goimports,
      -- diagnostic.golangci_lint,
      formatting.black,
      formatting.isort,
      diagnostic.flake8,
      formatting.rufo,
    },
  }
end

return M
