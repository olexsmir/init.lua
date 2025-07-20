---@type LazySpec
return {
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
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
      files = { "todo", "Projects/*", "*.todo*", "*.pali*" },
      metadata = {
        next = { style = { fg = "#0db9d7" } },
        done = {
          key = "<localleader>td",
          style = { fg = "#96de7a" },
          get_value = function()
            return tostring(os.date "%Y-%m-%d")
          end,
        },
      },
      keys = {
        ["<localleader>T"] = "toggle",
        ["<localleader>c"] = "check",
        ["<localleader>u"] = "uncheck",
        ["<localleader>a"] = "create",
        ["<localleader>r"] = "remove_all_metadata",
        ["<localleader>A"] = "archive",
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
