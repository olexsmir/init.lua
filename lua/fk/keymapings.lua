local function map(mode, from, to, expr)
  if expr or false then
    vim.keymap.set(mode, from, to, { noremap = true, expr = true })
    return
  end

  vim.keymap.set(mode, from, to, { noremap = true, silent = true })
end

map("n", "<C-s>", "<cmd>write!<cr>")
map("i", "<C-s>", "<cmd>write!<cr>")
map("i", "jk", "<esc>")

map("n", "<S-h>", "<cmd>bp!<cr>")
map("n", "<S-l>", "<cmd>bn!<cr>")

map("n", "<leader>ps", "<cmd>PackerSync<cr>")

map("i", "<C-j>", 'pumvisible() ? "\\<down>" : "\\<C-j>"', true)
map("i", "<C-k>", 'pumvisible() ? "\\<up>" : "\\<C-k>"', true)
map("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', true)
map("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', true)

map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Down>", "<cmd>resize +2<cr>")
map("n", "<C-Up", "<cmd>resize -1<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

map("n", "<C-h>", "<cmd>wincmd h<cr>")
map("n", "<C-j>", "<cmd>wincmd j<cr>")
map("n", "<C-k>", "<cmd>wincmd k<cr>")
map("n", "<C-l>", "<cmd>wincmd l<cr>")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "J", ":move '>+1<CR>gv-gv")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
