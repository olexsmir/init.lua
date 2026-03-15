require("vim._core.ui2").enable { enable = true }
vim.cmd.packadd "nvim.undotree"
vim.cmd.packadd "nvim.difftool"

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
for _, p in ipairs {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "tohtml",
  "man",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
  "tutor_mode_plugin",
} do
  vim.g["loaded_" .. p] = 1
end
