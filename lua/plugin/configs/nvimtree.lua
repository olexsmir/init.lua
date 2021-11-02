local M = {}

function M.setup()
  local tree_cb = require("nvim-tree.config").nvim_tree_callback

  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    auto_close = true,
    auto_open = true,
    update_cwd = false,
    ignore_ft_on_setup = { ".git", "node_modules" },
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
      custom = {},
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

  vim.g.nvim_tree_gitignore = 1
  vim.g.nvim_tree_root_folder_modifier = ":t"

  --[[
  vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", ".bin" }
  vim.g.nvim_tree_gitignore = 1
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_git_hl = 1]]
end

return M
