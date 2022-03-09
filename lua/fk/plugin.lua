local function get_config(path)
  return string.format("require[[%s]]", path)
end

local function get_setup(path)
  return string.format("require[[%s]].setup()", path)
end

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use { "nvim-lua/plenary.nvim", module = "plenary" }
  use { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" }
  use "folke/tokyonight.nvim" -- theme
  -- use "gpanders/editorconfig.nvim"
  use "nathom/filetype.nvim"
  use "lewis6991/impatient.nvim"

  -- Helpers
  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "windwp/nvim-autopairs", config = get_config "fk.plugin.autopairs" }
  use { "ahmedkhalf/project.nvim", config = get_config "fk.plugin.project" }
  use {
    "numToStr/Comment.nvim",
    keys = { "gc" },
    config = get_setup "Comment",
  }

  -- git
  use { "lewis6991/gitsigns.nvim", config = get_config "fk.plugin.gitsigns" }
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = get_config "fk.plugin.neogit",
  }

  -- language specific
  use { "~/code/gopher.nvim", ft = "go" }
  use { "simrat39/rust-tools.nvim", module = "rust-tools" }

  -- appearance
  use { "folke/which-key.nvim", config = get_config "fk.plugin.whichkey" }
  use { "nvim-lualine/lualine.nvim", config = get_config "fk.plugin.statusline" }
  use { "folke/todo-comments.nvim", config = get_setup "todo-comments" }

  -- another menus :D
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = get_config "fk.plugin.nvimtree",
  }

  use {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    config = get_setup "trouble",
  }

  use {
    "akinsho/toggleterm.nvim",
    config = get_config "fk.plugin.terminal",
    module = "toggleterm",
    keys = "<C-t>",
  }

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    config = get_config "fk.plugin.telescope",
  }

  -- lsp
  use {
    "neovim/nvim-lspconfig",
    config = get_setup "fk.lsp",
    requires = {
      "williamboman/nvim-lsp-installer",
      "jose-elias-alvarez/null-ls.nvim",
      "folke/lua-dev.nvim",
    },
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    config = get_config "fk.plugin.cmp",
    event = "InsertEnter",
    module = "cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },

      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  }

  -- tests
  use {
    "rcarriga/vim-ultest",
    requires = { { "vim-test/vim-test", after = "vim-ultest" } },
    cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
  }

  -- syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = get_config "fk.plugin.treesitter",
  }
end)
