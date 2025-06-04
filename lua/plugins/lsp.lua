---@type LazySpec
return {
  "b0o/schemastore.nvim",
  {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      progress = {
        display = {
          render_limit = 2,
          done_ttl = 2,
        },
      },
    },
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      providers = { "lsp", "treesitter" },
      filetypes_denylist = {
        "NeogitStatus",
        "TelescopePrompt",
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    ---@module "lazydev"
    ---@type lazydev.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "mini.test", words = { "MiniTest" } },
        { path = "mini.ai", words = { "MiniAI" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        "lazy.nvim",
      },
    },
  },
  {
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
  },
}
