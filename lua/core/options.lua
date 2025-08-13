vim.opt.shell = "/bin/bash" -- fixes issues with fish shell

vim.diagnostic.config {
  update_in_insert = true,
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
}

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "-"

-- indenting
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- other cool stuff
vim.g.editorconfig = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
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
vim.o.scrolloff = 14
vim.o.sidescrolloff = 16
vim.o.signcolumn = "yes"
vim.o.hidden = true
vim.o.title = true
vim.o.linebreak = true
vim.o.wrap = false

-- spelling
vim.o.infercase = true
vim.o.spell = true
vim.o.spelllang = "en_us,uk"

-- listchars
vim.o.list = true
vim.opt.listchars:append {
  space = "·",
  trail = "~",
  tab = "│·",
}

vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "context:12",
  "algorithm:histogram",
  "linematch:200",
  "indent-heuristic",
  "inline:word",
}

vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- swap files
vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

-- disable builtin modules
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
