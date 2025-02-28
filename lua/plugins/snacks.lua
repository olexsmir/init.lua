---@type LazySpec
return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    image = {
      enabled = true,
      doc = { inline = false },
    },
  },
}
