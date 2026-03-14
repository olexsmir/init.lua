vim.pack.add { "https://github.com/lewis6991/gitsigns.nvim" }

require("gitsigns").setup {
  numhl = true,
  signs = {
    add = { text = "" },
    change = { text = "" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "" },
    untracked = { text = "" },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = "eol",
    delay = 300,
  },
}

local function wrap(fn)
  return function()
    return require("gitsigns")[fn]()
  end
end

Config.map("n", "]g", wrap "next_hunk")
Config.map("n", "[g", wrap "prev_hunk")
Config.map("n", "<leader>gs", wrap "stage_hunk")
Config.map("n", "<leader>gS", wrap "undo_stage_hunk")
Config.map("n", "<leader>gr", wrap "reset_hunk")
Config.map("n", "<leader>gh", wrap "preview_hunk")
Config.map("n", "<leader>gb", wrap "blame")

-- neogit
Config.later(function()
  vim.pack.add { "https://github.com/TimUntersberger/neogit" }

  Config.map("n", "<leader>gg", vim.cmd.Neogit)
  require("neogit").setup {
    kind = "vsplit",
    console_timeout = 8000,
    auto_close_console = false,
    disable_builtin_notifications = true,
    disable_commit_confirmation = true,
    disable_context_highlighting = true,
    disable_hint = true,
    auto_show_console = false,
    graph_style = "kitty",
    signs = {
      section = { "", "" },
      item = { "", "" },
      hunk = { "", "" },
    },
    commit_editor = {
      kind = "split",
      staged_diff_split_kind = "split_above",
    },
    integrations = {
      snacks = true,
    },
    sections = {
      recent = {
        folded = false,
        hidden = false,
      },
    },
  }
end)
