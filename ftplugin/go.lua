-- spacing
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- which-key
require("which-key").register({
  C = {
    name = "Coding",
    a = { "<cmd>GoTagAdd<cr>", "Add tags to struct" },
    r = { "<cmd>GoTagRm<cr>", "Remove tags to struct" },
    f = { "<cmd>GoFillStruct<cr>", "Fill struct" },
  },
}, {
  prefix = "<leader>",
  mode = "n",
  { noremap = true, silent = true },
})
