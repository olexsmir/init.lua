local dev_deps = true

---@type LazySpec
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dev = true,
  cmd = "GoInstallDeps",
  build = vim.cmd.GoInstallDeps,
  dependencies = {
    { "williamboman/mason.nvim", cond = dev_deps, config = true },
  },
  ---@type gopher.Config
  opts = {
    use_mason = dev_deps,
    log_level = vim.log.levels.TRACE,
    gotests = {
      template = "testify",
    },
  },
}
