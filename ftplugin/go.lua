local map = require("core.utils").map

-- setup debugger
require("gopher.dap").setup()

-- options
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- mapping
map("n", "<leader>;f", "<cmd>GoIfErr<cr>")
map("n", "<leader>;c", "<cmd>GoCmt<cr>")
map("n", "<leader>;g", "<cmd>GoGenerate<cr>")
map("n", "<leader>;o", "<cmd>GoTestAdd<cr>")
map("n", "<leader>;a", "<cmd>GoTestsAll<cr>")
map("n", "<leader>;e", "<cmd>GoTestsExpr<cr>")
