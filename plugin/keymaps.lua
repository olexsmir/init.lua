local map = Config.map

map("n", "<leader>u", vim.cmd.Undotree)
map("n", "<leader>n", ":e ~/org/notes/stuff.md<cr>")

-- i dont want any builtin keymap for my lsp
vim.keymap.del("n", "grn")
vim.keymap.del({ "n", "x" }, "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grx")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grt")
vim.keymap.del("n", "gO")

-- general
map({ "n", "x" }, "<leader>z", "1z=")
map("t", "<esc><esc>", "<C-\\><C-n>")
map("n", "<leader>q", "<cmd>quit!<cr>")
map("n", "<leader>w", "<cmd>update<cr>")
map("n", "<C-s>", "<cmd>update<cr>")
map("i", "jk", "<esc>")
map("n", "gd", "<C-]>") -- tags stuff
map("n", "<leader>h", "<cmd>nohlsearch<cr>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- window navigation and resize
map("n", "<C-h>", "<cmd>wincmd h<cr>")
map("n", "<C-j>", "<cmd>wincmd j<cr>")
map("n", "<C-k>", "<cmd>wincmd k<cr>")
map("n", "<C-l>", "<cmd>wincmd l<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Down>", "<cmd>resize +2<cr>")
map("n", "<C-Up>", "<cmd>resize -1<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- move lines
map("v", "<A-k>", ":move '<-2<CR>gv-gv")
map("v", "<A-j>", ":move '>+1<CR>gv-gv")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<", "<gv")
map("v", ">", ">gv")
