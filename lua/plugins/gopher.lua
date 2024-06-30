---@type LazySpec
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dev = true,
  ---@type gopher.Config
  opts = {
    log_level = vim.log.levels.TRACE,
    gotests = {
      template = "testify",
    },
  },
}
