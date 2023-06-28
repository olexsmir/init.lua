return {
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  { "olexsmir/gopher.nvim", ft = "go", dev = true },
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-sleuth", event = "VeryLazy" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      vim.cmd.colorscheme "tokyonight-night"
    end,
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
