if not vim.filetype then
  return
end

vim.filetype.add {
  extension = {
    lock = "yaml",
    gotmpl = "gotmpl",
    org_archive = "org",
  },
  filename = {
    [".gitignore"] = "conf",
    [".eslintrc"] = "jsonc",
    [".prettierrc"] = "jsonc",
    [".babelrc"] = "jsonc",
    [".flake8"] = "dosini",
  },
  pattern = {
    [".env.*"] = "sh",
    ["*.Dockerfile.*"] = "dockerfile",
    ["*/templates/**/*.html"] = "htmldjango",
  },
}
