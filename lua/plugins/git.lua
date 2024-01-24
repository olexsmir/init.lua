local map = require("core.utils").smap
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    keys = {
      { "]g", map("gitsigns", "next_hunk") },
      { "[g", map("gitsigns", "prev_hunk") },
      { "<leader>gs", map("gitsigns", "stage_hunk") },
      { "<leader>gu", map("gitsigns", "undo_stage_hunk") },
      { "<leader>gr", map("gitsigns", "reset_hunk") },
      { "<leader>gp", map("gitsigns", "preview_hunk") },
    },
    opts = {
      max_file_length = 1000,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = "eol",
        delay = 300,
      },
    },
  },

  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    keys = { { "<leader>gg", vim.cmd.Neogit } },
    opts = {
      kind = "vsplit",
      disable_builtin_notifications = true,
      disable_commit_confirmation = true,
      disable_hint = true,
      signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
    },
  },
}
