local map = require("core.utils").map

-- general
map("n", "<C-s>", "<cmd>write!<cr>")
map("i", "jk", "<esc>")
map("n", "<leader>h", "<cmd>nohlsearch<cr>")

--- buffers
map("n", "<S-h>", "<cmd>bp!<cr>")
map("n", "<S-l>", "<cmd>bn!<cr>")
map("n", "<leader>c", "<cmd>bdelete!<cr>")

-- select in pupup by C-j & C-k
map("i", "<C-j>", 'pumvisible() ? "\\<down>" : "\\<C-j>"', true)
map("i", "<C-k>", 'pumvisible() ? "\\<up>" : "\\<C-k>"', true)
map("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', true)
map("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', true)

-- window navigation and resize
map("n", "<C-h>", "<cmd>wincmd h<cr>")
map("n", "<C-j>", "<cmd>wincmd j<cr>")
map("n", "<C-k>", "<cmd>wincmd k<cr>")
map("n", "<C-l>", "<cmd>wincmd l<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Down>", "<cmd>resize +2<cr>")
map("n", "<C-Up", "<cmd>resize -1<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- move strings
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "J", ":move '>+1<CR>gv-gv")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- plugins
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- telescope
map("n", "<leader>f", "<cmd>Telescope find_files<cr>")
map("n", "<leader>b", "<cmd>Telescope buffers<cr>")
map("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>st", "<cmd>Telescope live_grep<cr>")

-- git
map("n", "<leader>gg", "<cmd>Neogit<cr>")
map("n", "<leader>gs", "<cmd>lua require[[gitsigns]].stage_hunk()<cr>")
map("n", "<leader>gr", "<cmd>lua require[[gitsigns]].reset_hunk()<cr>")
map("n", "<leader>gp", "<cmd>lua require[[gitsigns]].preview_hunk()<cr>")
