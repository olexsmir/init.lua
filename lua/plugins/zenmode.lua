---@type LazySpec
return {
  "folke/zen-mode.nvim",
  cmd = { "ZenMode" },
  keys = { { "<leader>zz", "<cmd>ZenMode<cr>" } },
  ---@module "zen-mode"
  ---@type ZenOptions
  opts = {
    window = {
      width = 130,
      options = {
        signcolumn = "no",
        colorcolumn = "0",
        number = false,
        relativenumber = false,
        wrap = true,
        list = false,
        cursorcolumn = false,
        laststatus = 0,
        spell = false,
      },
    },
    plugins = {
      kitty = {
        enabled = true,
        font = "+2",
      },
    },
  },
}
