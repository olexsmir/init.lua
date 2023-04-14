return {
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  { "olexsmir/gopher.nvim", ft = "go", dev = true },
  { "mbbill/undotree", cmd = "UndotreeToggle" },
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "tpope/vim-repeat", event = "VeryLazy" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      vim.cmd.colorscheme "tokyonight-night"
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    keys = "gc",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      disable_filetype = { "TelescopePrompt", "clojure" },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = true,
  },
  {
    "williamboman/mason.nvim",
    event = "VimEnter",
    config = true,
  },
}
