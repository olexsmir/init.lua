return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    keys = function()
      local g = require "gitsigns"
      return {
        { "]g", g.next_hunk },
        { "[g", g.prev_hunk },
        { "<leader>gs", g.stage_hunk },
        { "<leader>gu", g.undo_stage_hunk },
        { "<leader>gr", g.reset_hunk },
        { "<leader>gb", g.preview_hunk },
        { "<leader>gB", g.blame_line },
      }
    end,
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
