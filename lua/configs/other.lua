local M = {}

function M.autopairs()
  require("nvim-autopairs").setup {
    check_ts = true,
  }
end

function M.treesitter()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "go", "gomod", "python", "yaml", "comment" },
    indent = { enable = true, disable = { "python", "go", "yaml", "nix" } },
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    context_commentstring = { enable = true, enable_autocmd = false },
    autopairs = { enable = true },
    endwise = { enable = true },
  }
end

function M.project()
  require("project_nvim").setup {
    show_hidden = true,
    patterns = {
      ".git",
      "Makefile",
      "package.json",
      "deno.json",
      "go.mod",
      "pyproject.toml",
      "Cargo.toml",
    },
    exclude_dirs = {
      "~/.cargo",
      "~/.golang",
    },
  }
end

return M
