require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "go", "gomod", "python", "yaml" },
  indent = { enable = true, disable = { "python", "go", "yaml" } },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  context_commentstring = { enable = true, enable_autocmd = false },
  autopairs = { enable = true },
  endwise = { enable = true },
}
