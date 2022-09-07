require("nvim-dap-virtual-text").setup {}
require("dap-go").setup()
require "configs.dap.ui"

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})
