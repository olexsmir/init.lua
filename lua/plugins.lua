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
  use "rebelot/kanagawa.nvim" -- theme

  use { "~/code/gopher.nvim", ft = "go", module = "gopher" }
  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" }
  use { "ahmedkhalf/project.nvim", config = u.get.config "project" }
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
    config = u.get.config "autopairs",
  }

  use { -- status line
    "nvim-lualine/lualine.nvim",
    after = "kanagawa.nvim",
    config = u.get.config "statusline",
  }

  use { -- higlight todo, note, fix comments
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = u.get.setup "todo-comments",
  }

  use { -- smooth scroll
    "karb94/neoscroll.nvim",
    config = u.get.setup "neoscroll",
    keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>" },
  }
  -- git
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = u.get.config "gitsigns",
  }

  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = u.get.config "neogit",
  }

  -- picker & file explorer
  use {
    "nvim-telescope/telescope.nvim",
    config = u.get.config "telescope",
    requires = { "nvim-telescope/telescope-ui-select.nvim" },
  }

  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = u.get.config "nvimtree",
  }

  use { -- syntax
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = u.get.config "treesitter",
    module = "nvim-treesitter",
    requires = {
      { "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" },
      { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
    },
  }

  -- fast movment
  use {
    "phaazon/hop.nvim",
    branch = "v2",
    module = "hop",
    keys = { "f", "F", ",f", ",F" },
    config = u.get.config "hop",
  }

  -- '(lisp)
  use {
    "Olical/conjure",
    ft = { "clojure", "fennel" },
    config = u.get.config "conjure",
    branch = "develop",
  }

  use {
    "guns/vim-sexp",
    after = "conjure",
    requires = {
      "tpope/vim-sexp-mappings-for-regular-people",
      after = "vim-sexp",
    },
  }

  use { -- test runner
    "nvim-neotest/neotest",
    config = u.get.config "neotest",
    keys = { "<leader>t", "[t", "]t" },
    requires = {
      { "nvim-neotest/neotest-go", module = "neotest-go" },
    },
  }

  -- meason
  use {
    "williamboman/mason.nvim",
    event = "VimEnter",
    config = u.get.setup "mason",
  }

  -- deubugger
  use {
    "mfussenegger/nvim-dap",
    module = "dap",
    config = u.get.config "dap",
    requires = {
      { "rcarriga/nvim-dap-ui", module = "dapui" },
      { "theHamsta/nvim-dap-virtual-text", module = "nvim-dap-virtual-text" },
    },
  }

  -- lsp & completion
  use {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = u.get.config "lsp",
    requires = {
      { "williamboman/mason-lspconfig.nvim", module = "mason-lspconfig" },
      { "jose-elias-alvarez/null-ls.nvim", module = "null-ls" },
      { "b0o/schemastore.nvim", modules = "schemastore" },
      { "folke/lua-dev.nvim", module = "lua-dev" },
      { "lvimuser/lsp-inlayhints.nvim", module = "lsp-inlayhints" },
    },
  }

  use {
    "hrsh7th/nvim-cmp",
    event = "BufRead",
    config = u.get.config "cmp",
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      { "hrsh7th/cmp-emoji", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "PaterJason/cmp-conjure", after = "conjure" },
      { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
    },
  }

  use {
    "L3MON4D3/LuaSnip",
    module = "luasnip",
    config = u.get.config "luasnip",
    requires = "rafamadriz/friendly-snippets",
  }
end)
