return {
  "neovim/nvim-lspconfig",
  event = "BufRead",
  dependencies = {
    "b0o/schemastore.nvim",
    {
      "j-hui/fidget.nvim",
      config = true,
      dependencies = { "nvim-lspconfig" },
    },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      cmd = "LazyDev",
      dependencies = { "nvim-lspconfig", "Bilal2453/luvit-meta" },
      opts = {
        library = {
          { path = "luvit-meta/library", words = { "vim%.uv" } },
          "lazy.nvim",
          "gopher.nvim",
        },
      },
    },
    {
      "nvimtools/none-ls.nvim",
      dependencies = { "nvim-lspconfig" },
      config = function()
        require "plugins.lsp.null-ls"
      end,
    },
    {
      "RRethy/vim-illuminate",
      dependencies = { "nvim-lspconfig" },
      opts = {
        providers = { "lsp", "treesitter" },
        filetypes_denylist = {
          "NvimTree",
          "packer",
          "NeogitStatus",
          "TelescopePrompt",
        },
      },
      config = function(_, opts)
        require("illuminate").configure(opts)
      end,
    },
  },
  config = function()
    for name, conf in pairs(require "plugins.lsp.servers") do
      require "plugins.lsp.attach"
      require("lspconfig")[name].setup(vim.tbl_extend("force", {
        flags = { debounce_text_changes = 150 },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }, conf))
    end
  end,
}
