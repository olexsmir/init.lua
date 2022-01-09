local get_config = require("utils").get_config

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "rmehri01/onenord.nvim"

  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "~/code/gopher.nvim", ft = "go" }

  use { "ahmedkhalf/project.nvim", config = get_config "plugin.project" }
  use { "nvim-lualine/lualine.nvim", config = get_config "plugin.statusline" }

  use {
    "numToStr/Comment.nvim",
    keys = { "gc" },
    config = get_config "Comment",
  }

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = get_config "nvim-autopairs",
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
    "folke/lua-dev.nvim",
    ft = "lua",
    after = "nvim-lspconfig",
    config = get_config "lua-dev",
  }

  use {
    "akinsho/toggleterm.nvim",
    module = "toggleterm",
    keys = "<C-t>",
    config = get_config "plugin.terminal",
  }

  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = get_config "plugin.nvimtree",
  }

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    config = get_config "plugin.telescope",
  }

  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      { "jose-elias-alvarez/null-ls.nvim", after = "nvim-lspconfig" },
    },
    config = get_config "lsp",
  }

  use {
    "mfussenegger/nvim-dap",
    module = "dap",
    requires = {
      { "Pocco81/DAPInstall.nvim", module = "dap-install", requires = "nvim-dap" },
      { "theHamsta/nvim-dap-virtual-text", after = "nvim-dap", config = [[ require"nvim-dap-virtual-text".setup() ]] },
      { "nvim-telescope/telescope-dap.nvim", after = "nvim-dap", config = [[ require("telescope").load_extension "dap" ]] },
    },
    config = get_config "plugin.dap",
  }

  use {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    requires = {
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      {
        "saadparwaiz1/cmp_luasnip",
        after = "nvim-cmp",
        requires = {
          "L3MON4D3/LuaSnip",
          { "rafamadriz/friendly-snippets", after = "LuaSnip" },
        },
      },
    },
    config = get_config "plugin.cmp",
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
    requires = {
      { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
      { "nvim-treesitter/playground", after = "nvim-treesitter" },
    },
    config = get_config "plugin.treesitter",
  }

  use {
    "Smirnov-O/ts-unit.nvim",
    after = "nvim-treesitter",
    config = function()
      require("ts-unit").setup { keymaps = true }
    end,
  }

  use {
    "rcarriga/vim-ultest",
    requires = { { "vim-test/vim-test", after = "vim-ultest" } },
    cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
    run = "<cmd>UpdateRemotePlugins<cr>",
  }
end)
