require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "go", "gomod", "gowork", "make", "comment" },
  indent = { enable = true, disable = { "python" } },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  autopairs = { enable = true },
  endwise = { enable = true },
  rainbow = { enable = true },
}
