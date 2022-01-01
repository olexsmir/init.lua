local nmap = require("utils").nmap
local M = {}

function M.setup()
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.75,
        preview_cutoff = 120,
        prompt_position = "top",
        horizontal = { mirror = false },
        vertical = { mirror = false },
      },
      file_ignore_patterns = { ".git", "node_modules", "__pycache__", "target", "vendor", "env", ".bin" },
      path_display = { shorten = 5 },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      pickers = {
        find_files = { find_command = { "fd", "--type=file", "--hidden", "--smart-case" } },
        live_grep = { only_sort_text = true },
      },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-u>"] = false,
        },
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
    },
  }

  -- Extensions
  require("telescope").load_extension "projects"

  -- Mappings
  nmap("<leader>f", "<cmd>Telescope find_files<cr>")
  nmap("<leader>b", "<cmd>Telescope buffers<cr>")
  nmap("<leader>st", "<cmd>Telescope live_grep<cr>")
  nmap("<leader>sr", "<cmd>Telescope oldfiles<cr>")
  nmap("<leader>sb", "<cmd>Telescope git_branches<cr>")
  nmap("<leader>sc", "<cmd>Telescope git_commits<cr>")
  nmap("<leader>sk", "<cmd>Telescope keymaps<cr>")
end

return M
