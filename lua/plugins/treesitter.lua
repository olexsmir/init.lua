return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
    "p00f/nvim-ts-rainbow",
    { "nvim-treesitter/nvim-treesitter-context", config = true },
  },
  build = function()
    pcall(vim.cmd.TSUpdate)
  end,
  config = function()
    require("nvim-treesitter.configs").setup {
      auto_install = true,
      ensure_installed = {
        "lua",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "gitignore",
        "gitcommit",
        "query",
        "sql",
      },
      indent = { enable = true, disable = { "python" } },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      autopairs = { enable = true },
      endwise = { enable = true },
      rainbow = { enable = true },
    }
  end,
}
