local neotest = require "neotest"
local map = require("core.utils").map

neotest.setup {
  adapters = {
    require "neotest-go" { experimental = { test_table = true } },
    require "neotest-plenary",
    require "neotest-python",
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

map("n", "<leader>tn", neotest.run.run)
map("n", "<leader>ts", neotest.summary.toggle)
map("n", "<leader>tS", neotest.run.stop)
map("n", "<leader>to", neotest.output.open)
map("n", "]t", neotest.jump.next)
map("n", "[t", neotest.jump.prev)
map("n", "<leader>tt", function()
  neotest.run.run(vim.fn.expand "%")
end)
