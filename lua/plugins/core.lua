---@type LazySpec[]
return {
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tweekmonster/helpful.vim", cmd = "HelpfulVersion" },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = { style = "night" },
    init = function()
      vim.cmd.colorscheme "tokyonight"
    end,
  },
  {
    "oysandvik94/curl.nvim",
    opts = { default_flags = { "-i" } },
    cmd = { "CurlOpen" },
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
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      disable_filetype = { "TelescopePrompt", "markdown" },
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = false,
    init = function()
      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(filetype, option) ---@diagnostic disable-line: duplicate-set-field
        -- stylua: ignore
        return option == "commentstring"
          and require("ts_context_commentstring.internal").calculate_commentstring()
          or get_option(filetype, option)
      end
    end,
  },
}
