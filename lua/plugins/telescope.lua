return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>" },
    { "<leader>b", "<cmd>Telescope buffers<cr>" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>" },
    { "<leader>st", "<cmd>Telescope live_grep<cr>" },
  },
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
        filetypes = { theme = "ivy" },
        buffers = { theme = "ivy" },
        oldfiles = { theme = "ivy" },
        keymaps = { theme = "ivy" },
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

    telescope.load_extension "projects"
    telescope.load_extension "ui-select"
  end,
}
