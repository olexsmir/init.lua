local u = require "core.utils"
local map, expr = u.map, u.expr

-- general
map("n", "<C-s>", "<cmd>write!<cr>")
map("i", "jk", "<esc>")
map("n", "<leader>h", "<cmd>nohlsearch<cr>")
map("n", "<leader>n", "<cmd>e ~/Documents/Syncthing/Notes<cr>")

--- buffers
map("n", "<S-h>", "<cmd>bp!<cr>")
map("n", "<S-l>", "<cmd>bn!<cr>")
map("n", "<leader>c", "<cmd>bdelete!<cr>")
map("n", "<leader>q", "<cmd>quit!<cr>")
map("n", "<leader>w", "<cmd>write!<cr>")

-- select in pupup by C-j & C-k
expr("i", "<C-j>", 'pumvisible() ? "\\<down>" : "\\<C-j>"')
expr("i", "<C-k>", 'pumvisible() ? "\\<up>" : "\\<C-k>"')
expr("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
expr("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')

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
map("v", "<", "<gv")
map("v", ">", ">gv")

-- plugins
map("n", "<leader>e", vim.cmd.NvimTreeToggle)
map("n", "<leader>u", vim.cmd.UndotreeToggle)
map("n", "<leader>Ps", vim.cmd.PackerSync)
map("n", "<leader>Pc", vim.cmd.PackerCompile)
map("n", "<leader>gg", vim.cmd.Neogit)

-- telescope
map("n", "<leader>f", "<cmd>Telescope find_files<cr>")
map("n", "<leader>b", "<cmd>Telescope buffers<cr>")
map("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>sb", "<cmd>Telescope git_branches<cr>")
map("n", "<leader>st", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>sp", "<cmd>Telescope projects<cr>")
map("n", "<leader>sf", "<cmd>Telescope git_bcommits<cr>")
map("n", "<leader>sc", "<cmd>Telescope git_commits<cr>")

-- dap
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>")
map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>")
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>")
map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>")
