local map = require("core.utils").map

vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- some maps
map("n", "<localleader>t", ":=MiniTest.run_file()<CR>", true)
map("n", "<localleader>x", function()
  vim.cmd.source "%"
end, true)
