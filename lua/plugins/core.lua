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
    config = function()
      vim.cmd.colorscheme "tokyonight-night"
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = true,
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
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    ---@type ProjectOptions
    opts = {
      patterns = {
        "^\\.git$",
        "package.json",
        "go.mod",
        "go.work",
        "Cargo.toml",
        "deps.edn",
      },
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
}
