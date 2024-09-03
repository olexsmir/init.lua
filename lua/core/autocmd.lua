local u = require "core.utils"

u.aucmd("TextYankPost", {
  group = u.augroup "highlight_yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

u.aucmd("VimResized", {
  group = u.augroup "resize_splits",
  callback = function()
    vim.cmd "tabdo wincmd ="
    vim.cmd("tabnext " .. vim.fn.tabpagenr())
  end,
})

u.aucmd("FileType", {
  group = u.augroup "comments",
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})
