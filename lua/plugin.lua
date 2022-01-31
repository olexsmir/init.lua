local get_config = require("utils").get_config

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "rmehri01/onenord.nvim"

  use { "~/code/gopher.nvim", ft = "go" }
  use { "folke/lua-dev.nvim", ft = "lua", after = "nvim-lspconfig", config = get_config "lua-dev" }
  use { "metakirby5/codi.vim", cmd = "Codi" }

  use { "Olical/conjure", ft = "clojure", config = get_config "plugin.conjure" }
  use { "eraserhd/parinfer-rust", run = "cargo build --release", after = "conjure" }

  use { "kyazdani42/nvim-tree.lua", cmd = "NvimTreeToggle", config = get_config "plugin.nvimtree" }
  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "ahmedkhalf/project.nvim", config = get_config "plugin.project" }
  use { "nvim-lualine/lualine.nvim", config = get_config "plugin.statusline" }
  use { "pwntester/octo.nvim", cmd = "Octo" }

  use {
    "numToStr/Comment.nvim",
    keys = { "gc" },
    config = get_config "Comment",
  }

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    module = "nvim-autopairs",
    config = get_config "plugin.autopairs",
  }

  use {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = get_config "plugin.gitsigns",
  }

  use {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    config = get_config "todo-comments",
  }

  use {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    config = get_config "trouble",
  }

  use {
    "akinsho/toggleterm.nvim",
    module = "toggleterm",
    keys = "<C-t>",
    config = get_config "plugin.terminal",
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
      { "jose-elias-alvarez/null-ls.nvim", after = "nvim-lspconfig" },
      { "j-hui/fidget.nvim", after = "nvim-lspconfig", config = get_config "fidget" },
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
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
      { "PaterJason/cmp-conjure", after = "conjure" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      { "L3MON4D3/LuaSnip", module = "luasnip" },
      { "rafamadriz/friendly-snippets", after = "nvim-cmp" },
    },
  }

  use {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup { mapping = { "jk" } }
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    config = get_config "plugin.treesitter",
    requires = {
      { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
      { "nvim-treesitter/playground", after = "nvim-treesitter" },
    },
  }

  use {
    "rcarriga/vim-ultest",
    requires = { { "vim-test/vim-test", after = "vim-ultest" } },
    cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
    run = "<cmd>UpdateRemotePlugins<cr>",
  }
end)
