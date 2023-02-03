return {
  "neovim/nvim-lspconfig",
  event = "BufRead",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "b0o/schemastore.nvim",
    "folke/neodev.nvim",
    "lvimuser/lsp-inlayhints.nvim",
    { "j-hui/fidget.nvim", config = true },
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
  },
  config = function()
    local lspconfig = require "lspconfig"
    require("plugins.lsp.diagnostic").setup()
    require "plugins.lsp.inlayhints"
    require "plugins.lsp.null-ls"
    require("mason-lspconfig").setup { ensure_installed = { "sumneko_lua" } }
    require("neodev").setup {}

    for name, conf in pairs(require "plugins.lsp.servers") do
      lspconfig[name].setup(vim.tbl_extend("force", {
        on_attach = require("plugins.lsp.attach").common,
        flags = { debounce_text_changes = 150 },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }, conf))
    end
  end,
}
