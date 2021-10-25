local M = {}

function M.setup()
  require("dap").defaults.fallback.terminal_win_cmd = "50vsplit new"
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  })
end

return M
