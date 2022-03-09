local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

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
        ["<A-u>"] = false,
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
    buffers = { theme = "ivy" },
    oldfiles = { theme = "ivy" },
    keymaps = { theme = "ivy" },
    git_branches = { theme = "ivy" },
    git_commits = { theme = "ivy" },
    git_status = { theme = "ivy" },
    lsp_definitions = { theme = "ivy" },
    lsp_references = { theme = "ivy" },
    lsp_implementations = { theme = "ivy" },
    lsp_code_actions = { theme = "cursor" },
    lsp_document_symbols = { theme = "ivy" },
    reloader = { theme = "cursor" },
  },
}

-- Extensions
require("telescope").load_extension "projects"
