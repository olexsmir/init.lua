return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>" },
    { "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>" },
    { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>" },
    { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>" },
    { "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>" },
  },
  dependencies = {
    "rcarriga/nvim-dap-ui",
    { "theHamsta/nvim-dap-virtual-text", config = true },
  },
  config = function()
    require "plugins.dap.ui"
    vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "DiagnosticSignError",
      linehl = "",
      numhl = "",
    })
  end,
}
