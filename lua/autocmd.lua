vim.cmd [[ autocmd BufWritePre * lua mkdir() ]]
vim.cmd [[ autocmd TextYankPost * lua vim.highlight.on_yank {higroup = "IncSearch", timeout = 200 } ]]
