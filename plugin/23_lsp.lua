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
