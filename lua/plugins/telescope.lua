---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = function()
    local function grep_string()
      vim.ui.input({ prompt = "Grep: " }, function(input)
        require("telescope.builtin").grep_string { search = input }
      end)
    end

    local function wrap(fn)
      return function()
        return require("telescope.builtin")[fn]()
      end
    end

    return {
      { "<leader>f", wrap "find_files" },
      { "<leader>b", wrap "buffers" },
      { "<leader>sr", wrap "oldfiles" },
      { "<leader>sg", wrap "live_grep" },
      { "<leader>st", grep_string },
      { "<leader>sd", wrap "diagnostics" },
      { "<leader>sh", wrap "help_tags" },
    }
  end,
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        file_ignore_patterns = {
          "^\\.git$",
          "^\\.bin$",
          "^\\tmp$",
          "node_modules",
          "__pycache__",
          "target",
          "vendor",
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["<C-d>"] = actions.delete_buffer,
          },
        },
      },
      pickers = {
        find_files = { theme = "ivy" },
        live_grep = { theme = "ivy" },
        grep_string = { theme = "ivy" },
        filetypes = { theme = "ivy" },
        buffers = { theme = "ivy" },
        oldfiles = { theme = "ivy" },
        keymaps = { theme = "ivy" },
        help_tags = { theme = "ivy" },
        diagnostics = { theme = "ivy" },
        git_branches = { theme = "ivy" },
        git_commits = { theme = "ivy" },
        git_status = { theme = "ivy" },
        lsp_definitions = { theme = "ivy" },
        lsp_references = { theme = "ivy" },
        lsp_implementations = { theme = "ivy" },
        lsp_document_symbols = {
          theme = "ivy",
          fname_width = 0.1,
          symbol_width = 0.8,
          symbol_type_width = 0.1,
        },
      },
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_ivy {} },
      },
    }

    telescope.load_extension "ui-select"
    telescope.load_extension "fzf"
  end,
}
