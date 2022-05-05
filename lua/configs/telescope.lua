local actions = require "telescope.actions"
local telescope = require "telescope"

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    layout_config = {
      prompt_position = "top",
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    file_ignore_patterns = {
      "node_modules",
      "__pycache__",
      "target",
      "vendor",
      ".git",
      ".bin",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
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
  },
}

telescope.load_extension "projects"
