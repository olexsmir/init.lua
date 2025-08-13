if not vim.filetype then
  return
end

vim.filetype.add {
  extension = {
    lock = "yaml",
    gotmpl = "gotmpl",
    org_archive = "org",
    vil = "json",
  },
  filename = {
    [".eslintrc"] = "jsonc",
    [".prettierrc"] = "jsonc",
    [".babelrc"] = "jsonc",
    [".flake8"] = "dosini",
    [".editorconfig"] = "dosini",
    [".stignore"] = "gitignore",
    ["todo.txt"] = "todotxt",
    ["done.txt"] = "todotxt",
    ["obtf.txt"] = "markdown",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
    ["*.Dockerfile.*"] = "dockerfile",
    ["*/templates/**/*.html"] = "htmldjango",
    [".*/hypr/.+%.conf"] = "hyprlang",
    [".*/kitty/.+%.conf"] = "kitty",
  },
}
