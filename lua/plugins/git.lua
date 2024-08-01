---@type LazySpec[]
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    keys = function()
      --stylua: ignore
      return {
        { "]g", function() require("gitsigns").next_hunk() end },
        { "[g", function() require("gitsigns").prev_hunk() end},
        { "<leader>gs", function() require("gitsigns").stage_hunk() end},
        { "<leader>gS", function() require("gitsigns").undo_stage_hunk() end },
        { "<leader>gr", function() require("gitsigns").reset_hunk() end },
        { "<leader>gh", function() require("gitsigns").preview_hunk() end },
      }
    end,
    opts = {
      max_file_length = 1000,
      current_line_blame = true,
      signs = {
        add = { text = "" },
        change = { text = "" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "" },
        untracked = { text = "" },
      },
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
    ---@type NeogitConfig
    opts = {
      kind = "vsplit",
      disable_builtin_notifications = true,
      disable_commit_confirmation = true,
      disable_context_highlighting = true,
      disable_hint = true,
      signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
      commit_editor = { kind = "split", staged_diff_split_kind = "split_above" },
      integrations = { telescope = true },
    },
  },
}
