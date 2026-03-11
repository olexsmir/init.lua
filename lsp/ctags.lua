---@type vim.lsp.Config
return {
  cmd = { "ctags-lsp" },
  filetypes = { "odin", "c", "go", "rust", "make" },
  root_markers = { "tags" },
}
