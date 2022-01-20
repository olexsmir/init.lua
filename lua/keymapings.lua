local u = require "utils"
local nmap, map, expr = u.nmap, u.map, u.expr

-- General
nmap("<C-s>", "<cmd>write!<cr>")
nmap("<leader>h", "<cmd>nohlsearch<cr>")
nmap("<leader>q", "<cmd>quit!<cr>")
nmap("<leader>w", "<cmd>write!<cr>")
nmap("<leader>e", "<cmd>NvimTreeToggle<cr>")
nmap("<leader>ps", "<cmd>PackerSync<cr>")
nmap("<leader>c", "<cmd>bdelete<cr>")
nmap("<leader>n", "<cmd>e! /tmp/note.md<cr>")

-- Split
nmap("<C-Left>", "<cmd>vertical resize -2<cr>")
nmap("<C-Down>", "<cmd>resize +2<cr>")
nmap("<C-Up", "<cmd>resize -1<cr>")
nmap("<C-Right>", "<cmd>vertical resize +2<CR>")
for _, key in ipairs { "h", "j", "k", "l" } do
  nmap(string.format("<C-%s>", key), string.format("<cmd>wincmd %s<cr>", key))
  map("t", string.format("<C-%s>", key), string.format("<C-\\><C-N><C-w>%s", key))
end

-- Alternative for arrow up/down
expr("i", "<C-j>", 'pumvisible() ? "\\<down>" : "\\<C-j>"')
expr("i", "<C-k>", 'pumvisible() ? "\\<up>" : "\\<C-k>"')
expr("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
expr("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')

-- Line moves
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "J", ":move '>+1<CR>gv-gv")
nmap("<A-j>", ":m .+1<CR>==")
nmap("<A-k>", ":m .-2<CR>==")

-- Terminal
nmap("<leader>gg", "<cmd>lua term_cmd('lazygit')<cr>")
nmap("<leader>D", "<cmd> lua term_cmd('lazydocker')<cr>")

-- Ultest
nmap("<leader>tt", "<cmd>Ultest<cr>")
nmap("<leader>ts", "<cmd>UltestStop<cr>")
nmap("<leader>tc", "<cmd>UltestClear<cr>")
nmap("<leader>tn", "<cmd>UltestNearest<cr>")
nmap("<leader>to", "<cmd>UltestOutput<cr>")

-- Dap
nmap("<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
nmap("<leader>db", "<cmd>lua require'dap'.step_back()<cr>")
nmap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
nmap("<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>")
nmap("<leader>di", "<cmd>lua require'dap'.step_into()<cr>")
nmap("<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
nmap("<leader>du", "<cmd>lua require'dap'.step_out()<cr>")
nmap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
nmap("<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>")
nmap("<leader>dq", "<cmd>lua require'dap'.close()<cr>")

-- Telescope
nmap("<leader>f", "<cmd>Telescope find_files<cr>")
nmap("<leader>b", "<cmd>Telescope buffers<cr>")
nmap("<leader>st", "<cmd>Telescope live_grep<cr>")
nmap("<leader>sr", "<cmd>Telescope oldfiles<cr>")
nmap("<leader>sb", "<cmd>Telescope git_branches<cr>")
nmap("<leader>sc", "<cmd>Telescope git_commits<cr>")
nmap("<leader>sk", "<cmd>Telescope keymaps<cr>")
