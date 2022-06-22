local packer = require "packer"
local u = require "core.utils"

packer.init {
  profile = { enable = true },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "lewis6991/impatient.nvim"
  use "nathom/filetype.nvim"
  use "rebelot/kanagawa.nvim" -- theme
  use "~/code/gopher.nvim"

  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" }
  use { "ahmedkhalf/project.nvim", config = u.get.config "configs.project" }
  use { "gpanders/editorconfig.nvim", event = "BufRead" }

  use { -- commenting helper
    "numToStr/Comment.nvim",
    keys = "gc",
    event = "BufRead",
    config = u.get.setup "Comment",
  }

  use { -- auto pairs closer
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = u.get.config "configs.autopairs",
  }

  use { -- status line
    "nvim-lualine/lualine.nvim",
    after = "kanagawa.nvim",
    config = u.get.config "configs.statusline",
  }

  -- git
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = u.get.config "configs.gitsigns",
  }

  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = u.get.config "configs.neogit",
  }

  -- picker & file explorer
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = u.get.config "configs.telescope",
    requires = { "nvim-telescope/telescope-ui-select.nvim" },
  }

  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = u.get.config "configs.nvimtree",
  }

  use { -- syntax
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = u.get.config "configs.treesitter",
    requires = {
      { "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" },
    },
  }

  use { -- notes
    "nvim-neorg/neorg",
    requires = "nvim-treesitter/nvim-treesitter",
    config = u.get.config "configs.neorg",
  }

  -- lsp & completion
  use {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = u.get.config "configs.lsp",
    requires = {
      { "williamboman/nvim-lsp-installer", module = "nvim-lsp-installer" },
      { "jose-elias-alvarez/null-ls.nvim", module = "null-ls" },
      { "folke/lua-dev.nvim", module = "lua-dev" },
    },
  }

  use {
    "hrsh7th/nvim-cmp",
    event = "BufRead",
    config = u.get.config "configs.cmp",
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      { "hrsh7th/cmp-emoji", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
    },
  }

  use {
    "L3MON4D3/LuaSnip",
    module = "luasnip",
    requires = { { "rafamadriz/friendly-snippets", after = "nvim-cmp" } },
  }
end)
