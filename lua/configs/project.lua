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
