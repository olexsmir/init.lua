local get_config = require("utils").get_config

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "rmehri01/onenord.nvim" -- theme
  use "antoinemadec/FixCursorHold.nvim"
  use "gpanders/editorconfig.nvim"

  use { "lewis6991/impatient.nvim", config = "require'impatient'" }
  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "numToStr/Comment.nvim", keys = { "gc" }, config = get_config "Comment" }
  use { "windwp/nvim-autopairs", config = get_config "plugin.autopairs" }
  use { "ahmedkhalf/project.nvim", config = get_config "plugin.project" }

  -- languages
  use { "~/code/gopher.nvim", ft = "go" }
  use { "folke/lua-dev.nvim", ft = "lua", config = get_config "plugin.lua-dev" }
  use { "zah/nim.vim", ft = "nim" }

  -- git
  use { "TimUntersberger/neogit", cmd = "Neogit", config = get_config "neogit" }
  use { "lewis6991/gitsigns.nvim", config = get_config "plugin.gitsigns" }

  -- appearance
  use { "folke/which-key.nvim", config = get_config "plugin.whichkey" }
  use { "nvim-lualine/lualine.nvim", config = get_config "plugin.statusline" }
  use { "folke/todo-comments.nvim", config = get_config "todo-comments" }
  use { "goolord/alpha-nvim", config = get_config "plugin.alpha" }

  -- another menus :D
  use { "kyazdani42/nvim-tree.lua", cmd = "NvimTreeToggle", config = get_config "plugin.nvimtree" }
  use { "folke/trouble.nvim", cmd = { "Trouble", "TroubleToggle" }, config = get_config "trouble" }

  use {
    "akinsho/toggleterm.nvim",
    config = get_config "plugin.terminal",
    module = "toggleterm",
    keys = "<C-t>",
  }

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    config = get_config "plugin.telescope",
  }

  use {
    "neovim/nvim-lspconfig",
    config = get_config "lsp",
    requires = {
      "williamboman/nvim-lsp-installer",
      "jose-elias-alvarez/null-ls.nvim",
    },
  }

  use {
    "hrsh7th/nvim-cmp",
    config = get_config "plugin.cmp",
    event = "InsertEnter",
    module = "cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      { "L3MON4D3/LuaSnip", module = "luasnip", after = "nvim-cmp" },
      "rafamadriz/friendly-snippets",
    },
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    config = get_config "plugin.treesitter",
  }
end)
