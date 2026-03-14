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

Config.later(function()
  vim.pack.add { "https://github.com/j-hui/fidget.nvim" }
  require("fidget").setup {
    progress = {
      display = {
        render_limit = 2,
        done_ttl = 2,
      },
    },
  }
end)

Config.aucmd2("FileType", "lua", function()
  vim.pack.add { "https://github.com/folke/lazydev.nvim" }
  require("lazydev").setup {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "mini.nvim", words = { "MiniAI", "MiniTest" } },
      { path = "snacks.nvim", words = { "Snacks" } },
    },
  }
end)

Config.aucmd2("FileType", "markdown", function()
  vim.pack.add { "https://github.com/MeanderingProgrammer/render-markdown.nvim" }
  require("render-markdown").setup {}
end)

Config.aucmd2("FileType", "go", function()
  vim.pack.add { "file:///home/olex/code/gopher.nvim" }
  require("gopher").setup {
    log_level = vim.log.levels.TRACE,
    gotests = {
      template = "testify",
    },
  }
end)
