local M = {}

function M.setup()
  local null_ls = require "null-ls"
  local fmt = null_ls.builtins.formatting
  local lint = null_ls.builtins.diagnostics

  null_ls.setup {
    sources = {
      -- Lua
      fmt.stylua,
      lint.selene,

      -- Golang
      lint.golangci_lint,
      fmt.gofumpt,
      fmt.goimports,
      -- lint.revive,

      -- JavaScirpt
      fmt.prettierd,
      lint.eslint_d,

      -- Shell
      fmt.shfmt,
      lint.shellcheck,

      -- Python
      fmt.black,
      fmt.isort,
      lint.flake8,

      -- Rust
      fmt.rustfmt,
    },
  }
end

return M
