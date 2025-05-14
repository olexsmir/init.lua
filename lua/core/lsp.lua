require "plugins.lsp.attach"

vim.lsp.config("*", {
  root_markers = { ".git" },
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
