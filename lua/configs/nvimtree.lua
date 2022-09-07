require("nvim-tree").setup {
  diagnostics = { enable = true },
  renderer = { group_empty = true },
  git = { enable = true },
  filters = {
    custom = { "^\\.git$", "node_modules", "__pycache__", "vendor", "target" },
  },
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
