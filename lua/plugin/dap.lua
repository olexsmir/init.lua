local nmap = require("utils").nmap
local M = {}

function M.setup()
  vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  })
  vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  })
  vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  })

  -- Mappings
  nmap("<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
  nmap("<leader>db", "<cmd>lua require'dap'.step_back()<cr>")
  nmap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
  nmap("<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>")
  nmap("<leader>di", "<cmd>lua require'dap'.step_into()<cr>")
  nmap("<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
  nmap("<leader>du", "<cmd>lua require'dap'.step_out()<cr>")
  nmap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
  nmap("<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>")
  nmap("<leader>dq", "<cmd>lua require'dap'.close()<cr>")
end

return M
