local map = require("core.utils").map

-- options
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- mapping
map("n", "<leader>;f", "<cmd>GoIfErr<cr>")
map("n", "<leader>;c", "<cmd>GoCmt<cr>")

map("n", "<leader>;t", "<cmd>GoTestAdd<cr>")
map("n", "<leader>;a", "<cmd>GoTestsAll<cr>")
map("n", "<leader>;e", "<cmd>GoTestsExp<cr>")

map("n", "<leader>;s", require("scratch.gotest_switcher").switch)
