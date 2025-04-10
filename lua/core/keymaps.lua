local u = require "core.utils"

-- i dont want any builtin keymap for my lsp
if vim.fn.has "nvim-0.11" == 1 then
  vim.keymap.del("n", "grn")
  vim.keymap.del({ "n", "x" }, "gra")
  vim.keymap.del("n", "grr")
  vim.keymap.del("n", "gri")
  vim.keymap.del("n", "gO")
  vim.keymap.del({ "i", "s" }, "<C-s>")
end

-- general
u.map("n", "<leader>q", "<cmd>quit!<cr>")
u.map("n", "<leader>Q", "<cmd>tabclose!<cr>")
u.map("n", "<leader>w", "<cmd>write!<cr>")
u.map("n", "<C-s>", "<cmd>write!<cr>")
u.map("i", "jk", "<esc>")
u.map("n", "<leader>h", "<cmd>nohlsearch<cr>")
u.map("n", "<C-d>", "<C-d>zz")
u.map("n", "<C-u>", "<C-u>zz")

-- macros
u.map("n", "Q", "@qj")
u.map("x", "Q", ":norm @qj<cr>")

-- window navigation and resize
u.map("n", "<C-h>", "<cmd>wincmd h<cr>")
u.map("n", "<C-j>", "<cmd>wincmd j<cr>")
u.map("n", "<C-k>", "<cmd>wincmd k<cr>")
u.map("n", "<C-l>", "<cmd>wincmd l<cr>")
u.map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
u.map("n", "<C-Down>", "<cmd>resize +2<cr>")
u.map("n", "<C-Up", "<cmd>resize -1<cr>")
u.map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- move lines
u.map("v", "K", ":move '<-2<CR>gv-gv")
u.map("v", "J", ":move '>+1<CR>gv-gv")
u.map("n", "<A-j>", ":m .+1<CR>==")
u.map("n", "<A-k>", ":m .-2<CR>==")
u.map("v", "<", "<gv")
u.map("v", ">", ">gv")
