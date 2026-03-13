vim.pack.add {
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/tpope/vim-surround",
  "https://github.com/tpope/vim-repeat",
  "https://github.com/tpope/vim-speeddating",
  "https://github.com/wakatime/vim-wakatime",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/oysandvik94/curl.nvim",
  "file:///home/olex/code/gopher.nvim",
}

require("render-markdown").setup {}
require("todo-comments").setup {}

require("tokyonight").setup { style = "night" }
vim.cmd.colorscheme "tokyonight"

require("curl").setup {
  default_flags = { "-i" },
  open_with = "buffer",
}

require("gopher").setup {
  log_level = vim.log.levels.TRACE,
  gotests = {
    template = "testify",
  },
}
