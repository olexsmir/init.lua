require("nvim-tree").setup {
  update_cwd = true,
  diagnostics = { enable = true },
  filters = {
    dotfiles = true,
    custom = { "^\\.git$", "node_modules", "__pycache__", "vendor", "target" },
  },
  renderer = { group_empty = true },
  git = { enable = true, ignore = false },
  log = { enable = false },
  view = {
    side = "right",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
      },
    },
  },
}
