local dev_deps = false

---@module "gopher"
---@type LazySpec
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dev = true,
  cmd = "GoInstallDeps",
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
