-- based on https://github.com/y9san9/y9nika.nvim

vim.cmd.highlight "clear"
if vim.fn.exists "syntax_on" then vim.cmd.syntax "reset" end
vim.g.colors_name = "y9nika"

if vim.o.background == "dark" then
  require "kolir" {
    bg = "#0e1415",
    fg = "#dddddd",
    primary = "#71ade7",
    secondary = "#95cb82",
    muted = "#aaaaaa",
    marker = "#dfdf8e",
  }
else
  require "kolir" {
    bg = "#f7f7f7",
    fg = "#222222",
    primary = "#325cc0",
    secondary = "#448c27",
    muted = "#666666",
    marker = "#aa3731",
  }
end
