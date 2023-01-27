return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>" },
    { "<leader>b", "<cmd>Telescope buffers<cr>" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>" },
    { "<leader>st", "<cmd>Telescope live_grep<cr>" },
    { "<leader>sp", "<cmd>Telescope projects<cr>" },
    { "<leader>sf", "<cmd>Telescope git_bcommits<cr>" },
    { "<leader>sc", "<cmd>Telescope git_commits<cr>" },
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
  end,
}