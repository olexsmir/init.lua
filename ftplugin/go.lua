local map = require("core.utils").map

-- setup debugger
require("gopher.dap").setup()

-- options
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- mapping
map("n", "<leader>;f", vim.cmd.GoIfErr)
map("n", "<leader>;c", vim.cmd.GoCmt)
map("n", "<leader>;g", vim.cmd.GoGenerate)
map("n", "<leader>;o", vim.cmd.GoTestAdd)
map("n", "<leader>;a", vim.cmd.GoTestsAll)
map("n", "<leader>;e", vim.cmd.GoTestsExpr)
