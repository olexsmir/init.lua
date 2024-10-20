local diagnostic = {}

diagnostic.border = {
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
}

diagnostic.diagnostic = {
  virtual_text = true,
  update_in_insert = true,
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
    border = diagnostic.border,
    source = "always",
    header = "",
    prefix = "",
  },
}

function diagnostic.setup()
  vim.diagnostic.config(diagnostic.diagnostic)
  for _, sign in ipairs(diagnostic.diagnostic.signs.active) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
      numhl = "",
    })
  end
end

return diagnostic
