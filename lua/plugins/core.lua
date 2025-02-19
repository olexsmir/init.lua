---@type LazySpec
return {
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-speeddating", keys = { "<C-a>", "<C-x>" } },
  { "tweekmonster/helpful.vim", cmd = "HelpfulVersion" },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "pmizio/typescript-tools.nvim", ft = { "typescript" }, config = true },
  { "OXY2DEV/markview.nvim", ft = { "markdown" } },
  {
    "folke/tokyonight.nvim",
    opts = { style = "night" },
    init = function()
      vim.cmd.colorscheme "tokyonight"
    end,
  },
  {
    "oysandvik94/curl.nvim",
    dev = false,
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
      require("telescope").load_extension "todo-comments"
    end,
  },
  {
    "3rd/image.nvim",
    ft = { "markdown" },
    opts = {
      max_height_window_percentage = 65,
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
          clear_in_insert_mode = true,
        },
      },
    },
  },
}
