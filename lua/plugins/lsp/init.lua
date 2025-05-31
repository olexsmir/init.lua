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
}
