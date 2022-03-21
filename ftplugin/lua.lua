-- spacing
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- mappings
require("which-key").register({
  [";"] = {
    name = "Coding",
    t = { "<Plug>PlenaryTestFile", "Run current tests file" },
  },
}, {
  prefix = "<leader>",
  mode = "n",
  { noremap = true, silent = true },
})
