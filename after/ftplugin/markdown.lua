vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.wrap = true

vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = "c"
Config.autocmd("InsertEnter", { buffer = 0, callback = function() vim.opt_local.conceallevel = 0 end })
Config.autocmd("InsertLeave", { buffer = 0, callback = function() vim.opt_local.conceallevel = 2 end })

Config.map("n", "<localleader>t", require("s.tasks").complete, true)
Config.map("n", "<localleader>c", require("s.tasks").clear_archive, true)
Config.map("n", "<localleader>a", "<cmd>norm o- [ ] <cr>a", true)

vim.b.minihipatterns_config = {
  highlighters = {
    next = { pattern = "%#n[ext]*", group = "MiniTestPass" },
    tags = { pattern = "^tags%:", group = "Boolean" },
    links = { pattern = "https?://[^%s]+", group = "Tag" },
  },
}
