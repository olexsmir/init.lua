local M = {}

function M.setup()
  local tree_cb = require("nvim-tree.config").nvim_tree_callback

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
      filters = {
        dotfiles = true,
        custom = { ".git", "node_modules", "__pycache__", "vendor", "env", ".bin" },
      },
    },
    view = {
      width = 30,
      auto_resize = false,
      hide_root_folder = true,
      mappings = {
        custom_only = false,
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        },
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
  }

  vim.g.nvim_tree_group_empty = 1
end

return M
