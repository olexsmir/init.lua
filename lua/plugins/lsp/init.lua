---@type LazySpec
return {
  "b0o/schemastore.nvim",
  { import = "plugins.lsp.lazydev" },
  { import = "plugins.lsp.null-ls" },

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
    "nvim-cmp",
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
          vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          })
        end,
      },
    },
    ---@module "cmp"
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "nvim_lsp",
        group_index = 0,
        max_item_count = 12,
      })
    end,
  },
}
