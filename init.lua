vim.loader.enable()
require("vim._core.ui2").enable { enable = true }

-- i like my helpers -------------------------------------------------
Config = {}
Config.map = function(mode, from, to, buffer)
  vim.keymap.set(mode, from, to, { silent = true, buffer = buffer or false })
end

Config.add = function(opts)
  local spec = type(opts) == "string" and { src = opts } or opts
  spec.src = "https://github.com/" .. spec.src
  spec.version = spec.version or vim.version.range "*"
  spec.name = spec.name or nil
  vim.pack.add { spec }
end

local grp = vim.api.nvim_create_augroup("olexsmir", { clear = true })
Config.autocmd = function(ev, opts)
  vim.api.nvim_create_autocmd(ev, vim.tbl_extend("force", { group = grp }, opts))
end
Config.aucmd = function(ev, pattern, callback, once)
  Config.autocmd(ev, { pattern = pattern, callback = callback, once = once })
end

Config.later = vim.schedule
Config.onpack = function(pname, kinds, callback)
  if type(kinds) == "string" then kinds = { kinds } end
  Config.aucmd("PackChanged", "*", function(ev)
    if not (ev.data.spec.name == pname and vim.tbl_contains(kinds, ev.data.kind)) then return end
    if not ev.data.active then vim.cmd.packadd(pname) end
    callback()
  end)
end

-- settings ----------------------------------------------------------
Config.later(function() vim.o.clipboard = "unnamedplus" end)
Config.later(function()
  vim.diagnostic.config {
    update_in_insert = true,
    virtual_text = { virt_text_pos = "eol", current_line = true },
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

vim.g.mapleader = " "
vim.g.maplocalleader = "-"

vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.o.exrc = true
vim.o.secure = true
vim.o.shell = "/bin/bash" -- fixes issues with fish shell
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.number = true
vim.o.termguicolors = true
vim.o.infercase = true
vim.o.completeopt = "menuone,noselect,noinsert,fuzzy,popup"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.pumheight = 8
vim.o.scrolloff = 14
vim.o.sidescrolloff = 16
vim.o.signcolumn = "yes"
vim.o.title = true
vim.o.wrap = false
vim.o.foldenable = false

vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

vim.o.spell = false
vim.o.spelllang = "en_us,uk"

vim.o.laststatus = 0
vim.o.showmode = false
vim.o.ruler = true
vim.o.rulerformat = "%27(%=%{%v:lua.require'ruler'()%}%)"

vim.o.list = true
vim.opt.listchars:append {
  space = "·",
  trail = "~",
  tab = "│·",
}

-- builtins
vim.cmd.packadd "nvim.undotree"
vim.cmd.packadd "nvim.difftool"

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
for _, p in ipairs {
  "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "spellfile_plugin",
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
  "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
  "tohtml", "2html_plugin",
  "remote_plugins", "rrhelper",
  "logipat", "matchit",
} do vim.g["loaded_" .. p] = 1 end

--- keymaps ----------------------------------------------------------
vim.keymap.del("n", "grn")
vim.keymap.del({ "n", "x" }, "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grx")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grt")

vim.cmd [[
  noremap! <c-r><c-d> <c-r>=strftime('%F')<cr>
]]

Config.map("i", "jk", "<esc>")
Config.map("t", "<esc><esc>", "<C-\\><C-n>")
Config.map({ "n", "x" }, "<leader>z", "1z=")
Config.map("n", "<leader>q", "<cmd>quit!<cr>")
Config.map("n", "<leader>w", "<cmd>update<cr>")
Config.map("n", "<leader>h", "<cmd>nohlsearch<cr>")
Config.map("n", "<leader>u", "<cmd>Undotree<cr>")
Config.map("n", "<leader>n", "<cmd>e ~/org/notes/stuff.md<cr>")
Config.map("n", "gd", "<C-]>") -- tags ux
Config.map("n", "<C-q>", "<cmd>copen<cr>")
Config.map("n", "<C-d>", "<C-d>zz")
Config.map("n", "<C-u>", "<C-u>zz")

Config.map("n", "<C-h>", "<cmd>wincmd h<cr>")
Config.map("n", "<C-j>", "<cmd>wincmd j<cr>")
Config.map("n", "<C-k>", "<cmd>wincmd k<cr>")
Config.map("n", "<C-l>", "<cmd>wincmd l<cr>")
Config.map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
Config.map("n", "<C-Down>", "<cmd>resize +2<cr>")
Config.map("n", "<C-Up>", "<cmd>resize -1<cr>")
Config.map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

Config.map("v", "<A-k>", ":move '<-2<CR>gv-gv")
Config.map("v", "<A-j>", ":move '>+1<CR>gv-gv")
Config.map("n", "<A-j>", ":move .+1<CR>==")
Config.map("n", "<A-k>", ":move .-2<CR>==")
Config.map("v", "<", "<gv")
Config.map("v", ">", ">gv")

--- autocmds ---------------------------------------------------------
Config.aucmd("TextYankPost", nil, function() vim.hl.on_yank() end)

Config.aucmd("VimResized", nil, function()
  vim.cmd "tabdo wincmd ="
  vim.cmd("tabnext " .. vim.fn.tabpagenr())
end)

Config.aucmd("BufReadPost", "*", function() vim.fn.setpos(".", vim.fn.getpos "'\"") end)

Config.autocmd("TermOpen", { pattern = "term://*", command = "startinsert" })
Config.autocmd("TermClose", { pattern = "term://*", command = "stopinsert" })

Config.autocmd("FileType", { pattern = { "help", "man" }, command = "wincmd L" })
Config.aucmd("FileType", nil, function()
  vim.opt.formatoptions:append {
    "l", -- long lines not broken in insert mode
    "1", -- don't break a line after a one-letter word
  }
  vim.opt.formatoptions:remove {
    "c", -- autowrap comments using textwidth with leader
    "r", -- don't auto-insert comment leader on enter in insert
    "o", -- don't auto-insert comment leader on o/O in normal
    "n", -- don't recognizes numbered lists
    "2", -- don't use the indent of second paragraph line
  }
end)
