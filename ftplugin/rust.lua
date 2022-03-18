-- spacing
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- mappings
require("which-key").register({
  [";"] = {
    name = "Coding",
    t = { "<cmd>RustToggleInlayHints<cr>", "Toggle type hints" },
    r = { "<cmd>RustRunnables<cr>", "Run" },
    R = { "<cmd>RustReloadWorkspace<cr>", "Reload Workspace" },
    K = { "<cmd>RustMoveItemUp<cr>", "Move current item up" },
    J = { "<cmd>RustMoveItemDown<cr>", "Move current item down" },
  },
}, {
  prefix = "<leader>",
  mode = "n",
  { noremap = true, silent = true },
})
