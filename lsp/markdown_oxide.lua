local u = require("core.utils").lsp

---@return vim.lsp.Config
return {
  cmd = { "markdown-oxide" },
  filetypes = { "markdown" },
  root_markers = { ".moxide.toml" },
  capabilities = u.capabilities {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}
