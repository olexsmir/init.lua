---@type LazySpec
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
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    auto_install = true,
    ensure_installed = { "sql", "markdown", "markdown_inline", "vim" },
    indent = { enable = true, disable = { "python" } },
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    autopairs = { enable = true },
    endwise = { enable = true },
    rainbow = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
