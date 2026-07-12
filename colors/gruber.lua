-- https://github.com/rexim/gruber-darker-theme

vim.cmd.highlight "clear"
if vim.fn.exists "syntax_on" then vim.cmd.syntax "reset" end
vim.g.colors_name = "gruber"

require "kolir" {
  bg = "#181818",
  fg = "#e4e4ef",
  primary = "#96a6c8",
  secondary = "#73c936",
  muted = "#ffdd33",
  marker = "#ff9000",
}
