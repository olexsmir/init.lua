---@type vim.lsp.Config
return {
  cmd = { "ctagls" },
  filetypes = { "odin", "c", "go", "rust", "make" },
  root_markers = { "tags" },
}
