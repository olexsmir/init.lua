Config.later(function()
  Config.add "tpope/vim-surround"
  Config.add "tpope/vim-speeddating"
  Config.add "tpope/vim-repeat"
  Config.add "wakatime/vim-wakatime"
end)

Config.later(function()
  Config.add "j-hui/fidget.nvim"
  require("fidget").setup {
    progress = { display = {
      render_limit = 2,
      done_ttl = 2,
    } },
  }
end)

Config.later(function()
  -- HACK: wait till https://github.com/neovim/neovim/pull/37727 gets merged
  -- mkdir -p ~/.local/share/nvim/site/pack/my-plugins/opt
  -- ln -s ~/code/gopher.nvim ~/.local/share/nvim/site/pack/my-plugins/opt/gopher.nvim
  vim.cmd.packadd "gopher.nvim"

  vim.cmd.packadd "curl.nvim"
  require("curl").setup {}

  vim.cmd.packadd "utest.nvim"
  require("utest").setup {}
  Config.map("n", "<leader>tn", require("utest").run)
  Config.map("n", "<leader>tt", require("utest").run_file)
  Config.map("n", "<leader>tc", require("utest").cancel)
  Config.map("n", "<leader>tr", require("utest").clear)
  Config.map("n", "<leader>tq", require("utest").qf)
end)

Config.add "folke/lazydev.nvim"
Config.aucmd("FileType", "lua", function()
  require("lazydev").setup { library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { path = "mini.nvim", words = { "MiniAI", "MiniTest", "MiniFiles" } },
    { path = "snacks.nvim", words = { "Snacks" } },
  } }
end, true)
