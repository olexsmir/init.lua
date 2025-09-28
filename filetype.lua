if not vim.filetype then
  return
end

vim.filetype.add {
  extension = {
    lock = "yaml",
    gotmpl = "gotmpl",
    vil = "json",
  },
  filename = {
    [".eslintrc"] = "jsonc",
    [".prettierrc"] = "jsonc",
    [".stignore"] = "gitignore",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
    ["*.Dockerfile.*"] = "dockerfile",
    [".*/hypr/.+%.conf"] = "hyprlang",
    [".*/kitty/.+%.conf"] = "kitty",
  },
}
