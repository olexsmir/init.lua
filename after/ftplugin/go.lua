local map = require("core.utils").map

-- options
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- mapping
map("n", "<localleader>f", "<cmd>GoIfErr<cr>")
map("n", "<localleader>c", "<cmd>GoCmt<cr>")

map("n", "<localleader>t", "<cmd>GoTestAdd<cr>")
map("n", "<localleader>a", "<cmd>GoTestsAll<cr>")
map("n", "<localleader>e", "<cmd>GoTestsExp<cr>")

map(
  "n",
  "<localleader><localleader>",
  require("scratch.gotest_switcher").switch
)
