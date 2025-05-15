local u = require("core.utils").lsp

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
  root_markers = u.root_marker {
    ".golangci.yml",
    ".golangci.yaml",
    ".golangci.toml",
    ".golangci.json",
  },
}
