vim.pack.add {
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/tpope/vim-surround",
  "https://github.com/tpope/vim-repeat",
  "https://github.com/tpope/vim-speeddating",
  "https://github.com/wakatime/vim-wakatime",
  "https://github.com/folke/tokyonight.nvim",
}

require("tokyonight").setup { style = "night" }
vim.cmd.colorscheme "tokyonight"

Config.later(function()
  vim.pack.add { "https://github.com/oysandvik94/curl.nvim" }
  require("curl").setup {
    default_flags = { "-i" },
    open_with = "buffer",
  }
end)

Config.later(function()
  vim.pack.add { "https://github.com/folke/todo-comments.nvim" }
  require("todo-comments").setup {}
end)

Config.event("FileType markdown", function()
  vim.pack.add { "https://github.com/MeanderingProgrammer/render-markdown.nvim" }
  require("render-markdown").setup {}
end)

Config.event("FileType go", function()
  vim.pack.add { "file:///home/olex/code/gopher.nvim" }
  require("gopher").setup {
    log_level = vim.log.levels.TRACE,
    gotests = {
      template = "testify",
    },
  }
end)
