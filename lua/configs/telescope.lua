local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    file_ignore_patterns = {
      ".git",
      "node_modules",
      "__pycache__",
      "target",
      "vendor",
      ".bin",
    },

    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-d>"] = actions.delete_buffer,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-d>"] = actions.delete_buffer,
      },
    },
  },
  pickers = {
    find_files = { theme = "ivy" },
    live_grep = { theme = "ivy" },
    buffers = { theme = "ivy" },
    oldfiles = { theme = "ivy" },
    keymaps = { theme = "ivy" },
    git_branches = { theme = "ivy" },
    git_commits = { theme = "ivy" },
    git_status = { theme = "ivy" },
    lsp_definitions = { theme = "ivy" },
    lsp_references = { theme = "ivy" },
    lsp_implementations = { theme = "ivy" },
    lsp_document_symbols = { theme = "ivy" },
  },
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_ivy {} },
  },
}

telescope.load_extension "projects"
telescope.load_extension "ui-select"
