local map = require("core.utils").smap
return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dt", map("dap", "toggle_breakpoint") },
      { "<leader>dc", map("dap", "continue") },
      { "<leader>di", map("dap", "step_into") },
      { "<leader>do", map("dap", "step_over") },
      { "<leader>dO", map("dap", "step_out") },
      { "<leader>dr", map("dap", "repl.toggle") },
      { "<leader>dl", map("dap", "run_to_cursor") },
      { "<leader>du", map("dap", "disconnect") },
      { "<leader>dT", map("dap", "terminate") },
    },
    dependencies = {
      { "theHamsta/nvim-dap-virtual-text", config = true },
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup {
            layouts = {
              elements = {
                { id = "scopes", size = 0.25 },
                { id = "breakpoints", size = 0.25 },
              },
              size = 40,
              position = "left",
            },
          }
        end,
      },
    },
    config = function()
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      local dap = require "dap"
      local dapui = require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close {}
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close {}
      end
    end,
  },
  {
    "andrewferrier/debugprint.nvim",
    config = true,
    keys = { "g?" },
  },
}
