return {
  "neovim/nvim-lspconfig",
  event = "BufRead",
  dependencies = {
    "b0o/schemastore.nvim",
    {
      "j-hui/fidget.nvim",
      dependencies = { "nvim-lspconfig" },
      opts = {
        progress = { display = {
          render_limit = 2,
          done_ttl = 2,
        } },
      },
    },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      cmd = "LazyDev",
      dependencies = { "nvim-lspconfig", "Bilal2453/luvit-meta" },
      opts = {
        library = {
          { path = "luvit-meta/library", words = { "vim%.uv" } },
          { path = "mini.test", words = { "MiniTest" } },
          "lazy.nvim",
          "gopher.nvim",
          "neogit",
          "oil.nvim",
        },
      },
    },
    { import = "plugins.lsp.null-ls" },
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
