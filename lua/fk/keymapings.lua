local function expr(mode, from, to)
  vim.api.nvim_set_keymap(mode, from, to, { noremap = true, expr = true })
end

local function map(mode, from, to)
  vim.api.nvim_set_keymap(mode, from, to, { noremap = true, silent = true })
end

-- Mappings
map("n", "<C-s>", "<cmd>write!<cr>")
map("i", "jk", "<esc>")

map("n", "<S-h>", "<cmd>bp!<cr>")
map("n", "<S-l>", "<cmd>bn!<cr>")

expr("i", "<C-j>", 'pumvisible() ? "\\<down>" : "\\<C-j>"')
expr("i", "<C-k>", 'pumvisible() ? "\\<up>" : "\\<C-k>"')
expr("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
expr("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')

map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Down>", "<cmd>resize +2<cr>")
map("n", "<C-Up", "<cmd>resize -1<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
for _, key in ipairs { "h", "j", "k", "l" } do
  map("n", string.format("<C-%s>", key), string.format("<cmd>wincmd %s<cr>", key))
  map("t", string.format("<C-%s>", key), string.format("<C-\\><C-N><C-w>%s", key))
end

map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "J", ":move '>+1<CR>gv-gv")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
