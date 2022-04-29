local cmd = vim.api.nvim_create_autocmd

cmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})
