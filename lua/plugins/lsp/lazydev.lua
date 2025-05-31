---@type LazySpec
return {
  "folke/lazydev.nvim",
  ft = "lua",
  cmd = "LazyDev",
  ---@module "lazydev"
  ---@type lazydev.Config
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "mini.test", words = { "MiniTest" } },
      { path = "mini.ai", words = { "MiniAI" } },
      "snacks.nvim",
      "lazy.nvim",
    },
  },
}
