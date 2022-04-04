local border = {
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
}

local diagnostic = {
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
    border = border,
    source = "always",
    header = "",
    prefix = "",
  },
}

return function()
  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = border,
    })

  vim.diagnostic.config(diagnostic)
  for _, sign in ipairs(diagnostic.signs.active) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
      numhl = "",
    })
  end
end
