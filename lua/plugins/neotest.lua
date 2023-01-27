local function map(method)
  return string.format("<cmd>lua require[[neotest]].%s()<cr>", method)
end

return {
  "nvim-neotest/neotest",
  keys = {
    { "<leader>tn", map "run.run" },
    { "<leader>ta", map "run.attach" },
    { "<leader>ts", map "summary.toggle" },
    { "<leader>tS", map "run.stop" },
    { "<leader>to", map "output.open" },
    { "]t", map "jump.next" },
    { "[t", map "jump.prev" },
    {
      "]T",
      function()
        require("neotest").jump.next { status = "failed" }
      end,
    },
    {
      "[T",
      function()
        require("neotest").jump.prev { status = "failed" }
      end,
    },
    {
      "<leader>td",
      function()
        require("neotest").run.run { strategy = "dap" }
      end,
    },
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
    },
  },
  dependencies = {
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-plenary",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-go" { experimental = { test_table = true } },
        require "neotest-plenary",
      },
      icons = {
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed = "",
        passed = "",
        running = "",
        failed = "",
        unknown = "",
      },
      summary = {
        mappings = {
          expand = { "l", "h", "<CR>" },
          stop = "s",
        },
      },
    }
  end,
}
