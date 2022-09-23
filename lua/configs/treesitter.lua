require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "lua",
    "go",
    "gomod",
    "gowork",
    "python",
    "clojure",
    "yaml",
    "make",
    "comment",
  },
  indent = { enable = true, disable = { "python" } },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  context_commentstring = { enable = true, enable_autocmd = false },
  autopairs = { enable = true },
  endwise = { enable = true },
  rainbow = { enable = true },
}
