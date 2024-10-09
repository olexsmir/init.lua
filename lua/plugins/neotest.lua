---@type LazySpec
return {
  "nvim-neotest/neotest",
  keys = function()
    -- stylua: ignore
    return {
      { "<leader>tn", function() require("neotest").run.run() end },
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand "%") end },
      { "<leader>tS", function() require("neotest").run.stop() end },
      { "<leader>to", function() require("neotest").output.open() end },
      { "<leader>ts", function() require("neotest").summary.toggle() end },
      { "<leader>tw", function() require("neotest").watch.toggle() end },
      { "]t", function() require("neotest").jump.next() end },
      { "[t", function() require("neotest").jump.prev() end },
      { "]T", function() require("neotest").jump.next { status = "failed" } end },
      { "[T", function() require("neotest").jump.prev { status = "failed" } end },
    }
  end,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "fredrikaverpil/neotest-golang",
    "nvim-neotest/neotest-plenary",
    "nvim-treesitter",
  },
  config = function()
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

    ---@type neotest.Config
    ---@diagnostic disable-next-line: missing-fields
    require("neotest").setup {
      adapters = {
        require "neotest-plenary",
        require "neotest-golang" {
          go_test_args = { "-count=1", "-timeout=60s" },
          testify_enabled = true,
        },
      },
      discovery = {
        enabled = true,
        concurrent = 0,
      },
      running = { concurrent = true },
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
      ---@diagnostic disable-next-line: missing-fields
      summary = {
        animated = false,
        ---@diagnostic disable-next-line: missing-fields
        mappings = {
          expand = { "l", "h", "<CR>" },
          stop = "s",
        },
      },
    }
  end,
}
