---@type LazySpec
return {
  "nvim-lua/plenary.nvim",
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-speeddating", keys = { "<C-a>", "<C-x>" } },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "MeanderingProgrammer/render-markdown.nvim", ft = "markdown", config = true },
  {
    "folke/tokyonight.nvim",
    opts = { style = "night" },
    init = function()
      vim.cmd.colorscheme "tokyonight"
    end,
  },
  {
    "oysandvik94/curl.nvim",
    version = false,
    cmd = { "CurlOpen", "CurlCollection" },
    ---@module "curl"
    ---@type curl_config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      default_flags = { "-i" },
      open_with = "buffer",
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {}
    end,
  },
  {
    "olexsmir/gopher.nvim",
    lazy = false,
    ---@module "gopher"
    ---@type gopher.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      log_level = vim.log.levels.TRACE,
      gotests = {
        template = "testify",
      },
    },
  },
}
