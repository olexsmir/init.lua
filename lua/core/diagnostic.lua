local diagnistic = {}

diagnistic.border = {
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
  { "", "FloatBorder" },
}

diagnistic.diagnostic = {
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
    border = diagnistic.border,
    source = "always",
    header = "",
    prefix = "",
  },
}

function diagnistic.setup()
  vim.diagnostic.config(diagnistic.diagnostic)
  for _, sign in ipairs(diagnistic.diagnostic.signs.active) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
      numhl = "",
    })
  end
end

return diagnistic
