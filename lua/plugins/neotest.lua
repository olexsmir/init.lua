local map = require("core.utils").smap
return {
  "nvim-neotest/neotest",
  keys = {
    { "<leader>tn", map("neotest", "run.run") },
    { "<leader>ta", map("neotest", "run.attach") },
    { "<leader>ts", map("neotest", "summary.toggle") },
    { "<leader>tS", map("neotest", "run.stop") },
    { "<leader>to", map("neotest", "output.open") },
    { "]t", map("neotest", "jump.next") },
    { "[t", map("neotest", "jump.prev") },
    { "]T", map("neotest", "jump.next", "{status = 'failed'}") },
    { "[T", map("neotest", "jump.prev", "{status = 'failed'}") },
    { "<leader>td", map("neotest", "run.run", "{strategy = 'dap'}") },
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
    "rouge8/neotest-rust",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-go" { experimental = { test_table = true } },
        require "neotest-plenary",
        require "neotest-rust",
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
