return {
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  { "olexsmir/gopher.nvim", ft = "go", dev = true },
  { "mbbill/undotree", cmd = "UndotreeToggle" },
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "gpanders/editorconfig.nvim", event = "BufRead" },
  {
    "numToStr/Comment.nvim",
    keys = "gc",
    event = "BufRead",
    config = true,
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
