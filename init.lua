vim.loader.enable()
require("vim._core.ui2").enable { enable = true }

-- i like my helpers ------------------------------------------------
Config = {}
Config.map = function(mode, from, to, buffer)
  vim.keymap.set(mode, from, to, {
    noremap = true,
    silent = true,
    buffer = buffer or false,
  })
end

Config.add = function(opts)
  if type(opts) == "string" then
    opts = { src = "https://github.com/" .. opts }
  else
    opts.src = "https://github.com/" .. opts.src
  end
  vim.pack.add { opts }
end

local grp = vim.api.nvim_create_augroup("olexsmir", { clear = true })
Config.autocmd = function(ev, opts)
  vim.api.nvim_create_autocmd(ev, vim.tbl_extend("force", { group = grp }, opts))
end

Config.aucmd = function(ev, pattern, callback)
  Config.autocmd(ev, { pattern = pattern, callback = callback })
end

Config.later = vim.schedule
Config.onpack = function(pname, kinds, callback)
  if type(kinds) == "string" then kinds = { kinds } end
  Config.aucmd("PackChanged", "*", function(ev)
    if not (ev.data.spec.name == pname and vim.tbl_contains(kinds, ev.data.kind)) then
      return
    end
    if not ev.data.active then vim.cmd.packadd(pname) end
    callback()
  end)
end

--- settings --------------------------------------------------------
Config.later(function()
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
end)

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

-- ruler
vim.o.laststatus = 0
vim.o.showmode = false
vim.o.ruler = true
vim.o.rulerformat = "%27(%=%{%v:lua.require'ruler'()%}%)"

-- other cool stuff
vim.g.editorconfig = true
vim.o.exrc = true
vim.o.shell = "/bin/bash" -- fixes issues with fish shell
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.completeopt = "menuone,noselect"
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
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
vim.o.spell = false
vim.o.spelllang = "en_us,uk"

-- listchars
vim.o.list = true
vim.opt.listchars:append {
  space = "·",
  trail = "~",
  tab = "│·",
}

vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- swap files
vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

-- builtins
vim.cmd.packadd "nvim.undotree"
vim.cmd.packadd "nvim.difftool"

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
for _, p in ipairs {
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
  "tutor_mode_plugin",
} do
  vim.g["loaded_" .. p] = 1
end
