return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
    "p00f/nvim-ts-rainbow",
    { "nvim-treesitter/nvim-treesitter-context", config = true },
    { "nvim-treesitter/playground" },
  },
  build = function()
    pcall(function()
      vim.cmd "TSUpdate"
    end)
  end,
  config = function()
    require("nvim-treesitter.parsers").get_parser_configs().gotmpl = {
      install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" },
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
    }

    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "gotmpl",
        "fish",
        "gitignore",
        "gitcommit",
        "query",
      },
      indent = { enable = true, disable = { "python" } },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      autopairs = { enable = true },
      endwise = { enable = true },
      rainbow = { enable = true },
    }
  end,
}
