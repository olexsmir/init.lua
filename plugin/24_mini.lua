Config.add "echasnovski/mini.nvim"

Config.map("n", "<leader>c", function()
  require("mini.bufremove").delete()
end)

require("mini.icons").setup {}
Config.later(function()
  require("mini.ai").setup {}
  require("mini.bufremove").setup { silent = true }
  require("mini.comment").setup {}
  require("mini.hipatterns").setup {}
  require("mini.pairs").setup {}
  require("mini.splitjoin").setup {}
  require("mini.test").setup {}
end)
