require("project_nvim").setup {
  show_hidden = true,
  patterns = {
    "^\\.git$",
    "Makefile",
    "package.json",
    "go.mod",
    "pyproject.toml",
    "Cargo.toml",
    "deps.edn",
  },
}
