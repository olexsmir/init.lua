Config.add "nvim-lua/plenary.nvim"
Config.add "tpope/vim-surround"
Config.add "tpope/vim-repeat"
Config.add "tpope/vim-speeddating"
Config.add "wakatime/vim-wakatime"
Config.add "folke/tokyonight.nvim"

require("tokyonight").setup { style = "night" }
vim.cmd.colorscheme "tokyonight"

vim.pack.add { "file:///home/olex/code/gopher.nvim" }
---@diagnostic disable-next-line: missing-fields
require("gopher").setup {
  log_level = vim.log.levels.TRACE,
  gotests = {
    template = "testify",
  },
}

Config.later(function()
  Config.add "oysandvik94/curl.nvim"
  require("curl").setup {
    default_flags = { "-i" },
    open_with = "buffer",
  }
end)

Config.later(function()
  Config.add "folke/todo-comments.nvim"
  require("todo-comments").setup {}
end)

Config.later(function()
  Config.add "j-hui/fidget.nvim"
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
  Config.add "folke/lazydev.nvim"
  require("lazydev").setup {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "mini.nvim", words = { "MiniAI", "MiniTest" } },
      { path = "snacks.nvim", words = { "Snacks" } },
    },
  }
end)

Config.aucmd2("FileType", "markdown", function()
  Config.add "MeanderingProgrammer/render-markdown.nvim"
  require("render-markdown").setup {}
end)
