local o, g = vim.opt, vim.g

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 1
g.do_filetype_lua = 1

-- leader
g.mapleader = " "
g.maplocalleader = ","

-- indent
o.smartindent = true
o.expandtab = true
o.cursorline = true
o.shiftwidth = 4
o.tabstop = 4

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

-- disable build-in modules
for _, i in pairs {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "tohtml",
  "man",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
} do
  vim.g["loaded_" .. i] = 1
end
