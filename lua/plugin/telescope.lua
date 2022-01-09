local M = {}

function M.setup()
  local actions = require "telescope.actions"
  local action_layout = require "telescope.actions.layout"
  -- local themes = require "telescope.themes"

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
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<A-p>"] = action_layout.toggle_preview,
          ["<C-u>"] = false,
        },
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<A-p>"] = action_layout.toggle_preview,
        },
      },
    },
    pickers = {
      find_files = { theme = "ivy" },
      live_grep = { theme = "ivy", only_sort_text = true },
      buffers = { theme = "ivy", previewer = false },
      oldfiles = { theme = "ivy" },
      keymaps = { theme = "ivy" },
      git_branches = { theme = "cursor" },
      git_commits = { theme = "cursor" },
      lsp_definitions = { theme = "cursor" },
      lsp_references = { theme = "cursor" },
      lsp_implementations = { theme = "cursor" },
      lsp_code_actions = { theme = "cursor" },
      lsp_document_symbols = { theme = "ivy" },
      reloader = { theme = "cursor" },
    },
  }

  -- Extensions
  require("telescope").load_extension "projects"
end

return M
