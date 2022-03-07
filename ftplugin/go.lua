-- spacing
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- which-key
require("which-key").register({
  [";"] = {
    name = "Coding",
    a = { "<cmd>GoTagAdd<cr>", "Add tags to struct" },
    r = { "<cmd>GoTagRm<cr>", "Remove tags from struct" },
    g = { "<cmd>GoGenerate<cr>", "Go generate" },
  },
}, {
  prefix = "<leader>",
  mode = "n",
  { noremap = true, silent = true },
})
