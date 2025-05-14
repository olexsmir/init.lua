---@return vim.lsp.Config
return {
  cmd = { "golangci-lint-langserver" },
  filetypes = { "go", "gomod" },
  init_options = {
    command = {
      "golangci-lint",
      "run",
      "--output.json.path=stdout",
      "--show-stats=false",
    },
  },
  --- TODO: use general root_markers and extend from it
  root_markers = {
    ".golangci.yml",
    ".golangci.yaml",
    ".golangci.toml",
    ".golangci.json",
    "go.work",
    "go.mod",
    ".git",
  },
}
