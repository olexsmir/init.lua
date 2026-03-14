---@type vim.lsp.Config
return {
  cmd = { "ctagls" },
  filetypes = { "odin", "c", "rust", "make" },
  root_markers = { "tags" },
}
