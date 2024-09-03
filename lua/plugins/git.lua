---@type LazySpec[]
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    keys = function()
      local function gitsigns(fn)
        return function()
          require("gitsigns")[fn]()
        end
      end

      return {
        { "]g", gitsigns "next_hunk" },
        { "[g", gitsigns "prev_hunk" },
        { "<leader>gs", gitsigns "stage_hunk" },
        { "<leader>gS", gitsigns "undo_stage_hunk" },
        { "<leader>gr", gitsigns "reset_hunk" },
        { "<leader>gh", gitsigns "preview_hunk" },
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
