require "fk.options"
require "fk.keymapings"
require "fk.disable"
require "fk.globals"
require "fk.plugin"

vim.cmd [[ autocmd TextYankPost * lua vim.highlight.on_yank() ]]

require("tokyonight").colorscheme()
require("impatient").enable_profile()
