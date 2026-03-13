vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- some maps
Config.map("n", "<localleader>t", ":=MiniTest.run_file()<CR>", true)
Config.map("n", "<localleader>x", function()
  vim.cmd.source "%"
  vim.print((vim.fn.expand "%:t") .. " reloaded")
end, true)
