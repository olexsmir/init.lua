return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "shaunsingh/nord.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "romgrk/barbar.nvim"

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugin.project").setup()
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugin.gitsigns").setup()
    end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugin.statusline").setup()
    end,
  }

  use {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  }

  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("lsp").setup()
    end,
  }

  use {
    "mfussenegger/nvim-dap",
    module = "dap",
    requires = {
      { "Pocco81/DAPInstall.nvim", requires = "nvim-dap" },
      { "theHamsta/nvim-dap-virtual-text", after = "nvim-dap", config = [[ require"nvim-dap-virtual-text".setup() ]] },
      { "nvim-telescope/telescope-dap.nvim", after = "nvim-dap", config = [[ require("telescope").load_extension "dap" ]] },
    },
    config = function()
      require("plugin.dap").setup()
    end,
  }

  use {
    "ray-x/go.nvim",
    ft = "go",
    config = function()
      require("go").setup { gofmt = "gpfumpt" }
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", requires = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
      } },
    },
    config = function()
      require("plugin.cmp").setup()
    end,
  }

  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup { mapping = { "jk" } }
    end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
      require("plugin.nvimtree").setup()
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require("plugin.telescope").setup()
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
    },
    branch = "0.5-compat",
    config = function()
      require("plugin.treesitter").setup()
    end,
  }

  use {
    "rcarriga/vim-ultest",
    requires = { { "vim-test/vim-test", after = "vim-ultest" } },
    cmd = { "Ultest", "UltestStop", "UltestClear", "UltestNearest", "UltestOutput" },
    run = ":UpdateRemotePlugins",
  }

  use {
    "Smirnov-O/ts-unit.nvim",
    after = "nvim-treesitter",
    config = function()
      require("ts-unit").setup { keymaps = true }
    end,
  }

  use {
    "akinsho/toggleterm.nvim",
    module = "toggleterm",
    keys = "<C-t>",
    config = function()
      require("plugin.terminal").setup()
    end,
  }
end)
