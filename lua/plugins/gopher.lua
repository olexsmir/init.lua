local dev_deps = false

---@type LazySpec
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  cmd = { "GoInstallDepsSync", "GoInstallDeps" },
  build = function()
    pcall(vim.cmd.GoInstallDeps)
  end,
  dependencies = {
    { "williamboman/mason.nvim", cond = dev_deps, config = true },
  },
  ---@module "gopher"
  ---@type gopher.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    use_mason = dev_deps,
    log_level = vim.log.levels.TRACE,
    gotests = {
      template = "testify",
    },
  },
}
