---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostic = null_ls.builtins.diagnostics

    null_ls.setup {
      sources = {
        formatting.pg_format,
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
      },
    }
  end,
}
