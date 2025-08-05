local u = require("core.utils").lsp

---@return vim.lsp.Config
return {
  cmd = { "markdown-oxide" },
  filetypes = { "markdown" },
  root_markers = { ".moxide.toml", ".obsidian" },
  capabilities = u.capabilities {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
  on_attach = function(_, bufnr)
    u.command(bufnr, "LspToday", { command = "jump", arguments = { "today" } })
    u.command(bufnr, "LspLastSunday", {
      command = "jump",
      arguments = { "last sunday" },
    })
  end,
}
