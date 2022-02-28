vim.g.nvim_tree_group_empty = 1

require("nvim-tree").setup {
  disable_netrw = true,
  hijack_netrw = true,
  auto_close = true,
  auto_open = true,
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
    dotfiles = false,
    custom = { ".git", "node_modules", "__pycache__", "vendor", "env", ".bin" },
  },
  view = {
    width = 30,
    auto_resize = false,
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}
