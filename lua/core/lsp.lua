local u = require "core.utils"

vim.lsp.config("*", {
  root_markers = u.lsp.default_markers,
  flags = { debounce_text_changes = 150 },
})

vim.lsp.enable {
  "gopls",
  "golangci_lint_ls",
  "lua_ls",
  "markdown_oxide",
  "jsonls",
  "yamlls",
}
