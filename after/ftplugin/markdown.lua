local map = require("core.utils").map

vim.opt_local.wrap = true
vim.opt_local.list = false
vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = "cv"

map("n", "<localleader>v", "<cmd>RenderMarkdown toggle<cr>", true)
map("n", "<localleader>t", require("scratch.tasks").complete, true)
map("n", "<localleader>c", require("scratch.tasks").clear_archive, true)
map("n", "<localleader>a", "<cmd>norm o- [ ] <cr>a", true)
map("n", "<localleader>n", "<cmd>norm A #n<cr>", true)

vim.b.minihipatterns_config = {
  highlighters = {
    next = { pattern = "%#n[ext]*", group = "MiniTestPass" },
    front = { pattern = "front%:", group = "@boolean" },
    feat = { pattern = "feat%:", group = "@boolean" },
    chore = { pattern = "chore%:", group = "@character" },
    refactor = { pattern = "refactor%:", group = "@comment.info" },
    fix = { pattern = "fix%:", group = "@comment.error" },
    docs = { pattern = "docs%:", group = "@label" },
    test = { pattern = "test%:", group = "@comment.note" },
  },
}
