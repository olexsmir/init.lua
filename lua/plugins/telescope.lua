return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>" },
    { "<leader>b", "<cmd>Telescope buffers<cr>" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>" },
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
        filetypes = { theme = "ivy" },
        buffers = { theme = "ivy" },
        oldfiles = { theme = "ivy" },
        keymaps = { theme = "ivy" },
        help_tags = { theme = "ivy" },
        git_branches = { theme = "ivy" },
        diagnostics = { theme = "ivy" },
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
    telescope.load_extension "fzf"
  end,
}
