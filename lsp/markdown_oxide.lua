---@return vim.lsp.Config
return {
  cmd = { "markdown-oxide" },
  filetypes = { "markdown" },
  root_markers = { ".moxide.toml", ".obsidian" },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}
