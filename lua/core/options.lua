local u = require "core.utils"
require("core.diagnostic").setup()

vim.opt.shell = "/bin/bash" -- fixes issues with fish shell

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- indenting
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- other cool stuff
vim.g.editorconfig = true
vim.o.spell = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = false
vim.o.relativenumber = false
vim.o.termguicolors = true
vim.o.mousemodel = "extend"
vim.o.completeopt = "menuone,noselect"
vim.o.clipboard = "unnamedplus"
vim.o.fileencoding = "utf-8"
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.pumheight = 8
vim.o.numberwidth = 4
vim.o.scrolloff = 8
vim.o.sidescrolloff = 12
vim.o.signcolumn = "yes"
vim.o.hidden = true
vim.o.title = true
vim.o.linebreak = true
vim.o.wrap = false

-- listchars
vim.o.list = true
vim.opt.listchars:append {
  space = "·",
  trail = "~",
  tab = "│·",
}

-- swap files
vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

-- disable builtin modules
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

-- format options
u.aucmd("FileType", {
  group = u.augroup "formatoptions",
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
