local u = require("core.utils").lsp

---@return vim.lsp.Client
return {
  cmd = { "elm-language-server" },
  filetypes = { "elm" },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = 0 })
    if
      filetype == "elm" or (filetype == "json" and fname:match "elm%.json$")
    then
      on_dir(vim.fs.root(fname, "elm.json"))
      return
    end
    on_dir(nil)
  end,
  init_options = {
    elmReviewDiagnostics = "warning",
    skipInstallPackageConfirmation = false,
    disableElmLSDiagnostics = false,
    onlyUpdateDiagnosticsOnSave = false,
  },
  capabilities = u.capabilities {
    offsetEncoding = { "utf-8", "utf-16" },
  },
}
