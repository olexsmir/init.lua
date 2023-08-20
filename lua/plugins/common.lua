local map = require("core.utils").smap
return {
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
    "numToStr/Comment.nvim",
    event = "BufRead",
    keys = "gc",
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
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = {},
    keys = {
      { "<leader>pp", map("persistence", "load") },
    },
  },
}
