-- spacing
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- mappings
require("which-key").register({
  [";"] = {
    name = "Coding",
    t = { "<Plug>PlenaryTestFile", "Run tests in current file" },
  },
}, {
  prefix = "<leader>",
  mode = "n",
  { noremap = true, silent = true },
})
