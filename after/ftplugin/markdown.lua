local map = require("core.utils").map

vim.opt_local.wrap = true
vim.opt_local.list = false
vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = "cv"

map("n", "<localleader>v", "<cmd>Markview toggle<cr>", true)
map("n", "<localleader>t", require("scratch.tasks").complete, true)

vim.b.minihipatterns_config = {
  highlighters = {
    next = { pattern = "%#next", group = "MiniTestPass" },
    front = { pattern = "front%:", group = "@boolean" },
    feat = { pattern = "feat%:", group = "@boolean" },
    chore = { pattern = "chore%:", group = "@character" },
    refactor = { pattern = "refactor%:", group = "@comment.info" },
    fix = { pattern = "fix%:", group = "@comment.error" },
    docs = { pattern = "docs%:", group = "@label" },
  },
}
