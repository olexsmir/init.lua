local dap = require "dap"
local dapui = require "dapui"

require("nvim-dap-virtual-text").setup {}
require("dap-go").setup()

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})

dapui.setup {
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open {}
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close {}
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close {}
end
