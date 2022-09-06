local map = require("core.utils").map

vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

map("n", "<leader>;t", "<Plug>PlenaryTestFile")
