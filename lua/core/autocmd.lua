local cmd, opt = vim.api.nvim_create_autocmd, vim.opt_local

cmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

cmd("FileType", {
  pattern = "lua",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2

    require("core.utils").map("n", "<leader>;t", "<Plug>PlenaryTestFile")
  end,
})

cmd("FileType", {
  pattern = "go",
  callback = function()
    opt.expandtab = false
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
  end,
})

cmd("FileType", {
  pattern = "python",
  callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
  end,
})

cmd("FileType", {
  pattern = "javascript,typescript",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
  end,
})
