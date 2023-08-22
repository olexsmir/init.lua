return {
  "neovim/nvim-lspconfig",
  event = "BufRead",
  dependencies = {
    "b0o/schemastore.nvim",
    { "williamboman/mason-lspconfig.nvim", config = true },
    { "j-hui/fidget.nvim", config = true },
    {
      "folke/neodev.nvim",
      config = true,
      dependencies = { "nvim-lspconfig" },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "plugins.lsp.null-ls"
      end,
    },
    {
      "RRethy/vim-illuminate",
      config = function()
        require("illuminate").configure {
          providers = { "lsp", "treesitter" },
          filetypes_denylist = {
            "NvimTree",
            "packer",
            "NeogitStatus",
            "TelescopePrompt",
          },
        }
      end,
    },
    {
      "williamboman/mason.nvim",
      config = true,
      build = function()
        pcall(function()
          vim.cmd "MasonUpdate"
        end)
      end,
    },
  },
  config = function()
    require("plugins.lsp.diagnostic").setup()
    for name, conf in pairs(require "plugins.lsp.servers") do
      require("lspconfig")[name].setup(vim.tbl_extend("force", {
        on_attach = require("plugins.lsp.attach").common,
        flags = { debounce_text_changes = 150 },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }, conf))
    end
  end,
}
