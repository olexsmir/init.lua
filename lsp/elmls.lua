---@return vim.lsp.Client
return {
  cmd = { "elm-language-server" },
  filetypes = { "elm" },
  root_markers = { "elm.json" },
  init_options = {
    elmReviewDiagnostics = "warning",
    skipInstallPackageConfirmation = false,
    disableElmLSDiagnostics = false,
    onlyUpdateDiagnosticsOnSave = false,
  },
  capabilities = { offsetEncoding = { "utf-8", "utf-16" } },
}
