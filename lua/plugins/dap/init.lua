local map = require("core.utils").smap
return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", map("dap", "toggle_breakpoint") },
      { "<leader>dc", map("dap", "continue") },
      { "<leader>di", map("dap", "step_into") },
      { "<leader>do", map("dap", "step_over") },
      { "<leader>dO", map("dap", "step_out") },
      { "<leader>dr", map("dap", "repl.toggle") },
      { "<leader>dl", map("dap", "run_to_cursor") },
      { "<leader>du", map("dap", "disconnect") },
      { "<leader>dt", map("dap", "terminate") },
    },
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        opts = function()
          require "plugins.dap.ui"
        end,
      },
      { "theHamsta/nvim-dap-virtual-text", config = true },
    },
    config = function()
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })
    end,
  },
  {
    "andrewferrier/debugprint.nvim",
    config = true,
    keys = {
      "g?",
      {
        "<leader>P",
        map("debugprint", "debugprint", "{ variable = true }"),
        expr = true,
      },
    },
  },
}
