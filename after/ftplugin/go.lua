-- options
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- mapping
Config.map("n", "<localleader>f", "<cmd>GoIfErr<cr>", true)
Config.map("n", "<localleader>c", "<cmd>GoCmt<cr>", true)

Config.map("n", "<localleader>t", "<cmd>GoTestAdd<cr>", true)
Config.map("n", "<localleader>a", "<cmd>GoTestsAll<cr>", true)
Config.map("n", "<localleader>e", "<cmd>GoTestsExp<cr>", true)

Config.map("n", "<localleader>b", require("s.dlv").bset, true)
Config.map("n", "<localleader>B", require("s.dlv").clear, true)
