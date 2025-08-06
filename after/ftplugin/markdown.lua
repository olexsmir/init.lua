local map = require("core.utils").map

vim.opt_local.wrap = true
vim.opt_local.list = false
vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = "cv"

map("n", "<localleader>v", "<cmd>Markview toggle<cr>", true)
map("n", "<localleader>d", function()
  require("scratch.tasks").complete()
end)
