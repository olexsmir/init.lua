local function get_config(path)
  return string.format("require[[%s]]", path)
end

local function get_setup(path)
  return string.format("require[[%s]].setup()", path)
end

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "rmehri01/onenord.nvim" -- theme
  use "gpanders/editorconfig.nvim"
  use "lewis6991/impatient.nvim" -- fast loading

  -- Helpers
  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "numToStr/Comment.nvim", keys = { "gc" }, config = get_setup "Comment" }
  use { "windwp/nvim-autopairs", config = get_config "fk.plugin.autopairs" }
  use { "ahmedkhalf/project.nvim", config = get_config "fk.plugin.project" }
  use { "lewis6991/gitsigns.nvim", config = get_config "fk.plugin.gitsigns" }

  -- languages
  use { "~/code/gopher.nvim", ft = "go" }
  use { "folke/lua-dev.nvim", ft = "lua", config = get_config "fk.plugin.lua-dev" }
  use { "zah/nim.vim", ft = "nim" }

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

  -- Lsp
  use {
    "neovim/nvim-lspconfig",
    config = get_setup "fk.lsp",
    requires = {
      "williamboman/nvim-lsp-installer",
      "jose-elias-alvarez/null-ls.nvim",
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

  -- Tests
  use {
    "rcarriga/vim-ultest",
    requires = { { "vim-test/vim-test", after = "vim-ultest" } },
    cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestStopNearest", "UltestOutput", "UltestSummary" },
  }

  -- Syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = get_config "fk.plugin.treesitter",
  }
end)
