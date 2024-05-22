return {
  "neovim/nvim-lspconfig",
  event = "BufRead",
  dependencies = {
    "b0o/schemastore.nvim",
    { "williamboman/mason-lspconfig.nvim", config = true },
    {
      "j-hui/fidget.nvim",
      config = true,
      dependencies = { "nvim-lspconfig" },
    },
    {
      "folke/neodev.nvim",
      config = true,
      dependencies = { "nvim-lspconfig" },
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
        on_attach = require("plugins.lsp.attach").common,
        flags = { debounce_text_changes = 150 },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }, conf))
    end
  end,
}
