---@type LazySpec
return {
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-speeddating", keys = { "<C-a>", "<C-x>" } },
  { "tweekmonster/helpful.vim", cmd = "HelpfulVersion" },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "OXY2DEV/markview.nvim", ft = { "markdown" }, version = false },
  {
    "bngarren/checkmate.nvim",
    ft = "markdown",
    ---@module "checkmate"
    ---@type checkmate.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      files = { "todo", "Projects/*", "*.todo*", "*.pali*" },
      keys = {
        ["<localleader>t"] = "toggle",
        ["<localleader>c"] = "check",
        ["<localleader>u"] = "uncheck",
        ["<localleader>n"] = "create",
        ["<localleader>r"] = "remove_all_metadata",
        ["<localleader>a"] = "archive",
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
