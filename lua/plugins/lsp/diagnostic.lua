local M = {}

M.border = {
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
}

M.diagnostic = {
  virtual_text = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  signs = {
    active = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    },
  },
  float = {
    focusable = true,
    style = "minimal",
    border = M.border,
    source = "always",
    header = "",
    prefix = "",
  },
}

function M.setup()
  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = M.border,
    })

  vim.diagnostic.config(M.diagnostic)
  for _, sign in ipairs(M.diagnostic.signs.active) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
      numhl = "",
    })
  end
end

return M
