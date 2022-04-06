local o = vim.opt

vim.g.did_load_filetypes = 1

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- tab
o.smartindent = true
o.expandtab = true
o.cursorline = true
o.shiftwidth = 4
o.tabstop = 4

-- serarch
o.ignorecase = true
o.smartcase = true

o.number = true
o.termguicolors = true
o.completeopt = { "menuone", "noselect" }
o.clipboard = "unnamedplus"
o.timeoutlen = 250
o.fileencoding = "utf-8"
o.mouse = "a"
o.showmode = false
o.splitbelow = true
o.splitright = true
o.pumheight = 8
o.numberwidth = 4
o.scrolloff = 8
o.sidescrolloff = 8
o.signcolumn = "yes"
o.hidden = true
o.title = true
o.wrap = false

-- swap files
o.undofile = true
o.swapfile = false
o.writebackup = false
