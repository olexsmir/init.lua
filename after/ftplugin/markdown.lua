local map = require("core.utils").map

vim.opt_local.wrap = false

map("n", "<localleader>t", "<cmd>Markview toggle<cr>", true)
map("n", "<localleader>T", "<cmd>Markview Toggle<cr>", true)
