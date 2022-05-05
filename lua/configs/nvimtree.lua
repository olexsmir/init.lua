require("nvim-tree").setup {
  disable_netrw = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = true,
    custom = { ".git", "node_modules", "__pycache__", "vendor" },
  },
  git = { enable = true, ignore = false },
  view = {
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
      },
    },
  },
}