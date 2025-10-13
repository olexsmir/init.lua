local u = require "core.utils"

-- i dont want any builtin keymap for my lsp
vim.keymap.del("n", "grn")
vim.keymap.del({ "n", "x" }, "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grt")
vim.keymap.del("n", "gO")

-- notes
u.map("n", "<leader>a", require("scratch.tasks").agenda)
u.map("n", "<leader>nt", "<cmd>e ~/org/notes/TODO.md<cr>")
u.map("n", "<leader>nn", "<cmd>e ~/org/notes/0Inbox.md<cr>")

-- general
u.map({ "n", "x" }, "<leader>z", "1z=")
u.map("t", "<esc><esc>", "<C-\\><C-n>")
u.map("n", "<leader>q", "<cmd>quit!<cr>")
u.map("n", "<leader>w", "<cmd>update<cr>")
u.map("n", "<C-s>", "<cmd>update<cr>")
u.map("i", "jk", "<esc>")
u.map("n", "<leader>h", "<cmd>nohlsearch<cr>")
u.map("n", "<C-d>", "<C-d>zz")
u.map("n", "<C-u>", "<C-u>zz")

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
u.map("v", "<A-k>", ":move '<-2<CR>gv-gv")
u.map("v", "<A-j>", ":move '>+1<CR>gv-gv")
u.map("n", "<A-j>", ":m .+1<CR>==")
u.map("n", "<A-k>", ":m .-2<CR>==")
u.map("v", "<", "<gv")
u.map("v", ">", ">gv")
