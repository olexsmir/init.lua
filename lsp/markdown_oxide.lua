---@return vim.lsp.Config
return {
  cmd = { "markdown-oxide" },
  filetypes = { "markdown" },
  root_markers = { ".git", ".obsidian", ".moxide.toml" },
  --- TODO: extend capabilities
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}
