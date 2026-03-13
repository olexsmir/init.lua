Config.aucmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})

Config.aucmd("VimResized", {
  callback = function()
    vim.cmd "tabdo wincmd ="
    vim.cmd("tabnext " .. vim.fn.tabpagenr())
  end,
})

Config.aucmd("FileType", {
  pattern = { "help", "man" },
  command = "wincmd L",
})

Config.aucmd("FileType", {
  callback = function()
    vim.opt.formatoptions:remove {
      "c", -- autowrap comments using textwidth with leader
      "r", -- don't auto-insert comment leader on enter in insert
      "o", -- don't auto-insert comment leader on o/O in normal
      "n", -- don't recognized numbered lists
      "2", -- don't use the indent of second paragraph line
    }

    vim.opt.formatoptions:append {
      "l", -- long lines not broken in insert mode
      "1", -- don't break a line after a one-letter word
    }
  end,
})
