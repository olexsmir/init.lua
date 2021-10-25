local M = {}

function M.setup()
  local tree_cb = require("nvim-tree.config").nvim_tree_callback

  vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", ".bin" }
  vim.g.nvim_tree_gitignore = 1
  vim.g.nvim_tree_quit_on_open = 0
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_root_folder_modifier = ":t"

  require("nvim-tree").setup {
    auto_close = true,
    update_cwd = true,
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 30,
      side = "left",
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        },
      },
    },
  }
end

return M
