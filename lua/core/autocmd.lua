local cmd, opt = vim.api.nvim_create_autocmd, vim.opt_local
local map = require("core.utils").map

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

    map("n", "<leader>;t", "<Plug>PlenaryTestFile")
  end,
})

cmd("FileType", {
  pattern = "go",
  callback = function()
    opt.expandtab = false
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4

    map("n", "<leader>;to", "<cmd>GoTestAdd<cr>")
    map("n", "<leader>;ta", "<cmd>GoTestsAll<cr>")
    map("n", "<leader>;te", "<cmd>GoTestsExpr<cr>")
    map("n", "<leader>;g", "<cmd>GoGenerate<cr>")
    map("n", "<leader>;c", "<cmd>GoCmt<cr>")
    map("n", "<leader>;e", "<cmd>GoIfErr<cr>")
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
  pattern = "javascript,typescript,json",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
  end,
})
