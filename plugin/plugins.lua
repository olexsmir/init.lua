Config.add "nvim-lua/plenary.nvim"
Config.add "tpope/vim-surround"
Config.add "tpope/vim-repeat"
Config.add "tpope/vim-speeddating"
Config.add "wakatime/vim-wakatime"
Config.add "folke/tokyonight.nvim"

require("tokyonight").setup { style = "night" }
vim.cmd.colorscheme "tokyonight"

Config.add "oysandvik94/curl.nvim"
Config.later(function()
  require("curl").setup {
    default_flags = { "-i" },
    open_with = "buffer",
  }
end)

Config.add "j-hui/fidget.nvim"
Config.later(function()
  require("fidget").setup {
    progress = {
      display = {
        render_limit = 2,
        done_ttl = 2,
      },
    },
  }
end)

Config.later(function()
  -- HACK: wait till https://github.com/neovim/neovim/pull/37727 gets merged
  -- mkdir -p ~/.local/share/nvim/site/pack/my-plugins/opt
  -- ln -s ~/code/gopher.nvim ~/.local/share/nvim/site/pack/my-plugins/opt/gopher.nvim
  vim.cmd.packadd "gopher.nvim"
  require("gopher").setup {
    log_level = vim.log.levels.TRACE,
    gotests = { template = "testify" },
  }
end)

Config.add "folke/lazydev.nvim"
Config.aucmd("FileType", "lua", function()
  require("lazydev").setup {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "mini.nvim", words = { "MiniAI", "MiniTest", "MiniFiles" } },
      { path = "snacks.nvim", words = { "Snacks" } },
    },
  }
end)
