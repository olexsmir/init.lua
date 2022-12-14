local cmd = vim.api.nvim_create_autocmd

cmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

cmd("FileType", {
  pattern = "javascript,typescript,json,html,htmldjango,css",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end,
})
