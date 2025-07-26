---@type LazySpec
return {
  "nvim-lua/plenary.nvim",
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-speeddating", keys = { "<C-a>", "<C-x>" } },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "OXY2DEV/markview.nvim", ft = "markdown" },
  {
    "bngarren/checkmate.nvim",
    ft = "markdown",
    ---@module "checkmate"
    ---@type checkmate.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      files = { "Projects/*", "Journal/*", ".todo", ".pali" },
      keys = {
        ["<localleader>t"] = { rhs = "<cmd>Checkmate toggle<CR>" },
      },
    },
  },
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
      open_with = "vsplit",
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {}
    end,
  },
}
