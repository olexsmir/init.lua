---@type LazySpec
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dev = true,
  ---@type gopher.Config
  opts = {
    gotests = {
      template = "testify",
    },
  },
}
