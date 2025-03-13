---@type LazySpec
return {
  "folke/snacks.nvim",
  lazy = false,
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    image = {
      enabled = true,
      doc = { inline = false },
    },
  },
}
