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
        diagnostic.codespell.with {
          args = {
            "--ignore-words",
            vim.env.HOME .. "/.config/codespell-ignore.txt",
            "-",
          },
        },

        formatting.stylua,
        diagnostic.selene.with {
          condition = function(utils)
            return utils.root_has_file "selene.toml"
          end,
        },

        formatting.goimports,
        formatting.golines,

        formatting.clang_format,
        formatting.pg_format,
        formatting.prettierd.with {
          -- stylua: ignore
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "html", "json", "jsonc", "svelte", "astro" },
        },
      },
    }
  end,
}
