return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "LunarVim/onedarker.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "romgrk/barbar.nvim"
  -- use { "tpope/vim-surround", keys = { "c", "y", "d" } }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup {}
    end,
  }

  use {
    "neovim/nvim-lspconfig",
    requires = "williamboman/nvim-lsp-installer",
    config = function()
      require("plugin.configs.lsp.config").setup()
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("plugin.configs.lsp.null-ls").setup()
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugin.configs.project").setup()
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugin.configs.gitsigns").setup()
    end,
  }

  use {
    "Famiu/feline.nvim",
    config = function()
      require("plugin.configs.statusline").setup()
    end,
  }

  use {
    "rcarriga/vim-ultest",
    requires = { { "vim-test/vim-test", after = "vim-ultest" } },
    cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
    run = ":UpdateRemotePlugins",
    config = function()
      require("plugin.configs.ultest").setup()
    end,
  }

  use {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      {
        "saadparwaiz1/cmp_luasnip",
        requires = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
        after = "nvim-cmp",
      },
    },
    config = function()
      require("plugin.configs.cmp").setup()
    end,
  }

  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup { mapping = { "jk" } }
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("plugin.configs.telescope").setup()
    end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
      require("plugin.configs.nvimtree").setup()
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    requires = {
      "Smirnov-O/ts-unit.nvim",
      after = "nvim-treesitter",
      config = function()
        require("ts-unit").setup { keymaps = true }
      end,
    },
    config = function()
      require("plugin.configs.treesitter").setup()
    end,
  }

  use {
    "akinsho/toggleterm.nvim",
    keys = "<C-t>",
    config = function()
      require("plugin.configs.terminal").setup()
    end,
  }
end)
