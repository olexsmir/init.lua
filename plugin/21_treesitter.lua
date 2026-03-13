Config.packchange("nvim-treesitter", { "update" }, function()
  vim.cmd.TSUpdate()
end)

vim.pack.add {
  {
    -- TODO: switch to main
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "master",
  },
  "https://github.com/RRethy/nvim-treesitter-endwise",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
}

require("treesitter-context").setup()

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup {
  auto_install = true,
  ensure_installed = { "sql", "markdown", "markdown_inline", "query" },
  ignore_install = { "org" },
  indent = { enable = true, disable = { "python" } },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  autopairs = { enable = true },
  endwise = { enable = true },
}
