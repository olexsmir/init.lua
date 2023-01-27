return {
  "TimUntersberger/neogit",
  cmd = "Neogit",
  keys = {
    { "<leader>gg", vim.cmd.Neogit },
  },
  opts = {
    kind = "vsplit",
    disable_builtin_notifications = true,
    disable_commit_confirmation = true,
    disable_hint = true,
    signs = {
      section = { "", "" },
      item = { "", "" },
      hunk = { "", "" },
    },
  },
}
