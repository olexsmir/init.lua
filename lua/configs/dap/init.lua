local dap = require "dap"

require("nvim-dap-virtual-text").setup {}
require "configs.dap.ui"

-- NOTE: go setuping in ftplugin/go.lua
require "configs.dap.langs.python"(dap)

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})
