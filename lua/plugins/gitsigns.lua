local map = require("core.utils").smap
return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  keys = {
    { "]g", map("gitsigns", "next_hunk"), buffer = 0 },
    { "[g", map("gitsigns", "prev_hunk"), buffer = 0 },
    { "<leader>gs", map("gitsigns", "stage_hunk"), buffer = 0 },
    { "<leader>gu", map("gitsigns", "undo_stage_hunk"), buffer = 0 },
    { "<leader>gr", map("gitsigns", "reset_hunk"), buffer = 0 },
    { "<leader>gp", map("gitsigns", "preview_hunk"), buffer = 0 },
    { "<leader>gd", map("gitsigns", "diffthis"), buffer = 0 },
  },
  opts = {
    max_file_length = 1000,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text_pos = "eol",
      delay = 300,
    },
  },
}
