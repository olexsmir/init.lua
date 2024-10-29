---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lspconfig" },
  config = function()
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostic = null_ls.builtins.diagnostics

    null_ls.setup {
      sources = {
        formatting.stylua,
        diagnostic.selene,
        formatting.goimports,
        formatting.golines,
        formatting.clang_format,
        formatting.pg_format,
        diagnostic.codespell,
      },
    }
  end,
}
