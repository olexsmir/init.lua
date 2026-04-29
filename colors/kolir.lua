vim.cmd.highlight "clear"
if vim.fn.exists "syntax_on" then vim.cmd.syntax "reset" end
vim.g.colors_name = "kolir"
vim.o.background = "dark"
require "kolir" {
  fg = "#c0caf5",
  bg = "#1a1b26",
  primary = "#7aa2f7", -- declarations
  secondary = "#9ece6a", -- vars/consts
  muted = "#9d7cd8", -- keywords
  marker = "#e0af68", -- comments, search, errors
}
