local cmd, opt = vim.api.nvim_create_autocmd, vim.opt_local

cmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

cmd("FileType", {
  pattern = "javascript,typescript,json",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
  end,
})
