local map = require("core.utils").smap
return {
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  { "olexsmir/gopher.nvim", ft = "go", dev = true },
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tweekmonster/helpful.vim", cmd = "HelpfulVersion" },
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
    "numToStr/Comment.nvim",
    config = true,
    keys = "gc",
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        show_hidden = true,
        patterns = {
          "^\\.git$",
          "Makefile",
          "Justfile",
          [[Taskfile\.ya?ml]],
          [[docker-compose\.ya?ml]],
          "*.Dockerfile.*",
          "package.json",
          "go.mod",
          "go.work",
          "pyproject.toml",
          "Cargo.toml",
          "deps.edn",
        },
      }
    end,
  },
  {
    "echasnovski/mini.bufremove",
    keys = { { "<leader>c", map("mini.bufremove", "delete", "0, false") } },
  },
}
