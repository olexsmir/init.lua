local cmd = vim.api.nvim_create_autocmd

cmd("TextYankPost", {
  pattern = "*",
  command = ":lua vim.highlight.on_yank()",
})
