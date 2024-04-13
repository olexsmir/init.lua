return {
  "nvim-neotest/neotest",
  keys = function()
    local n = require "neotest"

    -- stylua: ignore
    return {
      { "<leader>tn", function() n.run.run() end },
      { "<leader>ts", function() n.summary.toggle() end },
      { "<leader>tS", function() n.run.stop() end },
      { "<leader>to", function() n.output.open() end },
      { "<leader>tO", function() n.output_panel.toggle() end },
      { "<leader>tw", function() n.watch.toggle() end },
      { "<leader>tt", function() n.run.run(vim.fn.expand "%") end },
      { "]t", function() n.jump.next() end },
      { "[t", function() n.jump.prev() end },
      { "]T", function() n.jump.next {status = "failed"} end },
      { "[T", function() n.jump.prev {status = "failed"} end },
    }
  end,
  dependencies = {
    "nvim-neotest/nvim-nio",
    { "roveo/neotest-go", branch = "feat/testify-suite" },
    "nvim-neotest/neotest-plenary",
    "nvim-treesitter",
  },
  init = function()
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local r, _ = diagnostic.message
            :gsub("\n", " ")
            :gsub("\t", " ")
            :gsub("%s+", " ")
            :gsub("^%s+", "")
          return r
        end,
      },
    }, vim.api.nvim_create_namespace "neotest")
  end,
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-plenary",
        require "neotest-go" {
          experimental = { test_table = true },
          args = { "-count=1", "-timeout=60s" },
        },
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
