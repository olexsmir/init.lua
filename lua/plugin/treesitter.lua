local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "go", "gomod" },
    highlight = { enable = true },
    indent = { enable = true, disable = { "python", "yml" } },
    autotag = { enable = true },
    context_commentstring = { enable = true },
    rainbow = {
      enable = false,
      extended_mode = true,
      max_file_lines = 500,
    },
    refactor = {
      highlight_definitions = { enable = true },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        scope_incremental = "<CR>",
        node_incremental = "<TAB>",
        node_decremental = "<S-TAB>",
      },
    },
    playground = {
      enable = true,
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
  }
end

return M
