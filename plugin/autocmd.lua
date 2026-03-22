Config.aucmd("TextYankPost", nil, function()
  vim.hl.on_yank()
end)

Config.aucmd("VimResized", nil, function()
  vim.cmd "tabdo wincmd ="
  vim.cmd("tabnext " .. vim.fn.tabpagenr())
end)

Config.autocmd("FileType", {
  pattern = { "help", "man" },
  command = "wincmd L",
})

Config.autocmd("TermOpen", { pattern = "term://*", command = "startinsert" })
Config.autocmd("TermClose", { pattern = "term://*", command = "stopinsert" })

Config.aucmd("BufReadPost", "*", function()
  vim.fn.setpos(".", vim.fn.getpos "'\"")
end)

Config.aucmd("FileType", nil, function()
  vim.opt.formatoptions:remove {
    "c", -- autowrap comments using textwidth with leader
    "r", -- don't auto-insert comment leader on enter in insert
    "o", -- don't auto-insert comment leader on o/O in normal
    "n", -- don't recognizes numbered lists
    "2", -- don't use the indent of second paragraph line
  }

  vim.opt.formatoptions:append {
    "l", -- long lines not broken in insert mode
    "1", -- don't break a line after a one-letter word
  }
end)
