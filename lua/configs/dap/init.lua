require("nvim-dap-virtual-text").setup {}
require "configs.dap.ui"

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})