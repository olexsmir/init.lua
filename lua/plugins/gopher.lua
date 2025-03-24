---@type LazySpec
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  cmd = { "GoInstallDepsSync", "GoInstallDeps" },
  build = function()
    pcall(vim.cmd.GoInstallDeps)
  end,
  ---@module "gopher"
  ---@type gopher.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    log_level = vim.log.levels.TRACE,
    gotests = {
      template = "testify",
    },
  },
}
