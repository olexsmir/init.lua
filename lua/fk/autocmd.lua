vim.cmd [[ autocmd BufWritePre * lua mkdir() ]]
vim.cmd [[ autocmd TextYankPost * lua vim.highlight.on_yank {higroup = "Visual", timeout = 300 } ]]
