if not vim.filetype then
  return
end

vim.filetype.add {
  extension = {
    lock = "yaml",
  },
  filename = {
    [".gitignore"] = "conf",
    [".eslintrc"] = "jsonc",
    [".prettierrc"] = "jsonc",
    [".babelrc"] = "jsonc",
  },
  pattern = {
    [".env.*"] = "sh",
    ["*.Dockerfile.*"] = "dockerfile",
  },
}
