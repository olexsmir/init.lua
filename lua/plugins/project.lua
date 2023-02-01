return {
  "ahmedkhalf/project.nvim",
  lazy = false,
  config = function()
    require("project_nvim").setup {
      show_hidden = true,
      patterns = {
        "^\\.git$",
        "Makefile",
        "Justfile",
        "package.json",
        "go.mod",
        "go.work",
        "pyproject.toml",
        "Cargo.toml",
        "deps.edn",
      },
    }
  end,
}
