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

  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" }

  use {
    "ahmedkhalf/project.nvim",
    config = u.get_config "configs.project",
  }

  use {
    "numToStr/Comment.nvim",
    keys = "gc",
    event = "BufRead",
    config = u.get_setup "Comment",
  }

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = u.get_config "configs.autopairs",
  }

  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = u.get_config "configs.gitsigns",
  }

  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = u.get_config "configs.neogit",
  }

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    config = u.get_config "configs.telescope",
    wants = "telescope-ui-select.nvim",
    requires = {
      { "nvim-telescope/telescope-ui-select.nvim", after = "telescope.nvim" },
    },
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    config = u.get_config "configs.treesitter",
    requires = {
      { "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" },
    },
  }

  use {
    "nvim-lualine/lualine.nvim",
    after = "kanagawa.nvim",
    config = u.get_config "configs.statusline",
  }

  use {
    "nvim-neorg/neorg",
    ft = "norg",
    after = "nvim-treesitter",
    cmd = "Neorg",
    config = u.get_config "configs.neorg",
  }

  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = u.get_config "configs.nvimtree",
  }

  use {
    "hrsh7th/nvim-cmp",
    event = "BufRead",
    config = u.get_config "configs.cmp",
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
    },
  }

  use {
    "L3MON4D3/LuaSnip",
    module = "luasnip",
    requires = { { "rafamadriz/friendly-snippets", after = "nvim-cmp" } },
  }

  use {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = u.get_config "configs.lsp",
    requires = {
      { "williamboman/nvim-lsp-installer", module = "nvim-lsp-installer" },
      { "jose-elias-alvarez/null-ls.nvim", module = "null-ls" },
      { "folke/lua-dev.nvim", module = "lua-dev" },
    },
  }
end)
