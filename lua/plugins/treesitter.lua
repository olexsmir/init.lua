---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
    { "nvim-treesitter/nvim-treesitter-context", config = true },
    {
      "lukas-reineke/headlines.nvim",
      config = function()
        require("headlines").setup {
          go = {
            codeblock_highlight = "ColorColumn",
            query = vim.treesitter.query.parse(
              "go",
              [[([(raw_string_literal)
                  (interpreted_string_literal)] @codeblock
                (#match? @codeblock "--sql" "-- sql" "--SQL" "-- SQL")
                (#offset! @codeblock 0 0 1 0))]]
            ),
          },
        }
      end,
    },
  },
  build = function()
    pcall(vim.cmd.TSUpdate)
  end,
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    auto_install = true,
    ensure_installed = { "sql", "markdown", "markdown_inline", "vim", "query" },
    indent = { enable = true, disable = { "python" } },
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    autopairs = { enable = true },
    endwise = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
