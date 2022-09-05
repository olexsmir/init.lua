require("nvim-dap-virtual-text").setup {}
require("dap-go").setup()

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})
